import { TRPCError } from "@trpc/server";
import { z } from "zod";
import { createRouter } from "./context";

export const authRouter = createRouter()
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
  .query("get-all-apps", {
    resolve({ ctx }) {
      return ctx.prisma.app.findMany();
    },
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
  })
  .mutation("remove-app", {
    input: z.object({
      id: z.string(),
    }),
    async resolve({ ctx, input }) {
      return ctx.prisma.app.delete({
        where: {
          id: input.id,
        },
      });
    },
  });
