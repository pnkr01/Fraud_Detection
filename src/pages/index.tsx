import { signIn, signOut, useSession } from "next-auth/react";
import Link from "next/link";
import { ButtonLink } from "~/components/button-link";
import Card from "~/components/card";
import Layout from "~/components/layout";
import { NextPageWithAuthAndLayout } from "~/utils/types";
import { trpc } from "../utils/trpc";

const Home: NextPageWithAuthAndLayout = () => {
  const hello = trpc.useQuery(["example.hello", { text: "from tRPC" }]);
  const { data } = useSession();

  return (
    <>
      <div className=""></div>

      <div className="flex justify-between items-center border-b pb-4">
        <h1 className="text-lg ">List of apps</h1>
        <ButtonLink href="/apps/new" variant="secondary">
          Create a new app
        </ButtonLink>
      </div>
      <div className="mt-4 grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card name="Flipkart" description="App to test user" />
        <Card
          name="Amazon"
          description=" App to collect usage of application"
        />
        <Card name="Myntra" description="App to test user" />
      </div>
    </>
  );
};

export default Home;

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <Layout>{page}</Layout>;
};
