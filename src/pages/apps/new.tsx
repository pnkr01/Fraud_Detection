import { useSession } from "next-auth/react";
import { useRouter } from "next/router";
import React from "react";
import toast from "react-hot-toast";
import CreateAppForm from "~/components/create-app-form";
import Layout from "~/components/layout";
import { trpc } from "~/utils/trpc";

export default function NewApp() {
  const router = useRouter();
  const addAppMutation = trpc.useMutation("auth.add-app", {
    onError: (error) => {
      toast.error(`Something went wrong: ${error.message}`);
    },
  });
  const { data: session } = useSession();
  if (!session) {
    return;
  }
  return (
    <div>
      <h2 className="text-2xl font-bold mb-6">Register a new OAuth application</h2>
      <CreateAppForm
        isSubmitting={addAppMutation.isLoading}
        defaultValues={{
          name: "",
          description: "",
        }}
        backTo="/"
        onSubmit={(values) => {
          addAppMutation.mutate(
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

NewApp.getLayout = function getLayout(page: React.ReactElement) {
  return <Layout>{page}</Layout>;
};

NewApp.auth = true;
