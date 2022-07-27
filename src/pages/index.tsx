import { signIn, signOut, useSession } from "next-auth/react";
import { ButtonLink } from "~/components/button-link";
import Card from "~/components/card";
import Layout from "~/components/layout";
import { NextPageWithAuthAndLayout } from "~/utils/types";
import { trpc } from "../utils/trpc";

const Home: NextPageWithAuthAndLayout = () => {
  const { data: apps, isLoading } = trpc.useQuery(["auth.get-all-apps"]);
  const { data } = useSession();

  if (isLoading) {
    return <div>Loading...</div>;
  }
  return (
    <>
      <div className="flex justify-between items-center border-b pb-4">
        <h1 className="text-lg ">List of apps</h1>
        <ButtonLink href="/apps/new" variant="secondary">
          Create a new app
        </ButtonLink>
      </div>
      <div className="mt-4 grid grid-cols-1 lg:grid-cols-2 gap-6">
        {apps?.map((app) => (
          <Card
            key={app.id}
            name={app.name}
            clientId={app.client_id}
            clientSecret={app.client_secret}
            description={app.description}
          />
        ))}
      </div>
    </>
  );
};

export default Home;

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <Layout>{page}</Layout>;
};

Home.auth = true;