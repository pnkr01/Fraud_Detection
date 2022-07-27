import { TRPCError } from "@trpc/server";
import { z } from "zod";
import { createRouter } from "./context";

export const authRouter = createRouter()
  .query("get-all-apps", {
    resolve({ ctx }) {
      return ctx.prisma.app.findMany();
    },
  })
  .middleware(({ ctx, next }) => {
    if (!ctx.session) {
      throw new TRPCError({ code: "UNAUTHORIZED" });
    }

    return next({
      ctx: {
        ...ctx,
        session: ctx.session,
      },
    });
  })
  .mutation("add-app", {
    input: z.object({
      name: z.string().min(1),
      description: z.string().min(1),
    }),
    async resolve({ ctx, input }) {
      const post = await ctx.prisma.app.create({
        data: {
          name: input.name,
          description: input.description,
          user: {
            connect: {
              id: ctx.session.user.id,
            },
          },
        },
      });

      return post;
    },
  });
