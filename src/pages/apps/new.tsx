import { useSession } from "next-auth/react";
import { useRouter } from "next/router";
import React from "react";
import toast from "react-hot-toast";
import CreateAppForm from "~/components/create-app-form";
import { trpc } from "~/utils/trpc";

export default function NewApp() {
  const router = useRouter();
  const addQuestionMutation = trpc.useMutation("auth.add-app", {
    onError: (error) => {
      toast.error(`Something went wrong: ${error.message}`);
    },
  });
  const { data: session } = useSession();
  if (!session) {
    return;
  }
  return (
    <div className="container mx-auto min-h-screen max-w-4xl p-4">
      <h2 className="text-2xl font-bold">Register a new OAuth application</h2>
      <CreateAppForm
        isSubmitting={addQuestionMutation.isLoading}
        defaultValues={{
          name: "",
          description: "",
        }}
        backTo="/"
        onSubmit={(values) => {
          addQuestionMutation.mutate(
            { name: values.name, description: values.description },
            {
              onSuccess: (data) => router.push(`/`),
            }
          );
        }}
      />
    </div>
  );
}
