import { useRouter } from "next/router";
import React from "react";
import toast from "react-hot-toast";
import { trpc } from "~/utils/trpc";
import { Button } from "./button";

type CardProps = {
  id: string;
  name: string | null;
  description: string | null;
  apiKey: string | null;
};

export default function Card({ id, name, description, apiKey }: CardProps) {
  const removeAppMutation = trpc.useMutation("auth.remove-app", {
    onError: (error) => {
      toast.error(`Something went wrong: ${error.message}`);
    },
  });
  const router = useRouter();
  return (
    <div className="max-w-full bg-white rounded-lg border border-gray-200 shadow-sm">
      <div className="p-5">
        <h5 className="mb-2 text-2xl font-bold tracking-tight text-gray-900 ">
          {name}
        </h5>
        <p className="mb-3 font-normal text-gray-700">{description}</p>
        <div className="border-y py-2 my-4">
          <div>
            <h2 className="font-semibold">API Key</h2>
            <p>{apiKey}</p>
          </div>
        </div>
        <Button
          onClick={() => {
            removeAppMutation.mutate(
              { id: id },
              {
                onSuccess: (data) => {
                  toast(`Delete ${data.name} app successfully!`);
                  router.reload();
                },
              }
            );
          }}
          variant="danger"
        >
          Delete app
        </Button>
      </div>
    </div>
  );
}
