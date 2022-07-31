import { TRPCError } from "@trpc/server";
import { z } from "zod";
import { createRouter } from "./context";

export const authRouter = createRouter()
  .query("getAllProducts", {
    async resolve({ ctx }) {
      return ctx.prisma.product.findMany();
    },
  })
  .query("getOrderDetails", {
    input: z.object({
      orderId: z.number(),
    }),
    async resolve({ ctx, input }) {
      return ctx.prisma.order.findFirst({
        where: {
          id: Number(input.orderId),
        },
        include: {
          product: true,
          user: true,
        },
      });
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
  .mutation("updateUser", {
    input: z.object({
      age: z.number(),
      gender: z.string(),
    }),
    async resolve({ ctx, input }) {
      return ctx.prisma.user.update({
        where: {
          id: ctx.session.user.id,
        },
        data: {
          age: Number(input?.age),
          gender: input?.gender,
        },
      });
    },
  })
  .mutation("placeOrder", {
    input: z.object({
      productId: z.string(),
    }),
    async resolve({ ctx, input }) {
      return ctx.prisma.order.create({
        data: {
          userId: ctx.session.user.id,
          productId: input.productId,
          status: "placed",
        },
      });
    },
  });
