import { useRouter } from "next/router";
import React, { useEffect } from "react";
import AddProfileForm from "~/components/add-profile-form";
import Layout from "~/components/layout";
import { trpc } from "~/utils/trpc";

const AddProfileComponent = () => {
  const router = useRouter();
  const addProblemMutation = trpc.useMutation("auth.updateUser", {
    onError: (error) => {
      alert(`Something went wrong: ${error.message}`);
    },
  });

  return (
    <main className="max-w-7xl mx-auto sm:py-16 sm:px-6 lg:px-8">
      <h2 className="text-2xl font-semibold pb-12">Add your profile</h2>
      <AddProfileForm
        isSubmitting={false}
        defaultValues={{
          age: 18,
          gender: "male",
        }}
        backTo="/"
        onSubmit={(values) => {
          addProblemMutation.mutate(
            {
              age: +values.age,
              gender: values.gender,
            },
            {
              onSuccess: (data) => router.push(`/`),
            }
          );
          console.log(values);
        }}
      />
    </main>
  );
};

export default function AddProfile() {
  return <AddProfileComponent />;
}

AddProfile.getLayout = function getLayout(page: React.ReactElement) {
  return <Layout>{page}</Layout>;
};
