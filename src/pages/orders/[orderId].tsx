import { useRouter } from "next/router";
import React, { useEffect, useState } from "react";
import Layout from "~/components/layout";
import { useVisitorData } from "@fingerprintjs/fingerprintjs-pro-react";
import { trpc } from "~/utils/trpc";

export default function OrderPage() {
  const { query } = useRouter();
  const { orderId } = query;

  if (!orderId || typeof orderId !== "string") {
    return <div>No order ID found!</div>;
  }

  return <OrderPageContent orderId={Number(orderId)} />;
}

const CheckFraudComponent = () => {
  const [info, setInfo] = useState({
    ip: undefined,
    deviceId: undefined,
  });
  const { data: visitorData, isLoading, error } = useVisitorData();

  useEffect(() => {
    fetch("https://api.ipify.org/?format=json")
      .then((res) => res.json())
      .then((data) => {
        setInfo((oldState) => ({
          ...oldState,
          ip: data.ip,
        }));
      });
  }, []);

  if (isLoading) {
    return <div>Loading...</div>;
  }

  let userAgent = navigator.userAgent;
  let browserName;

  if (userAgent.match(/chrome|chromium|crios/i)) {
    browserName = "chrome";
  } else if (userAgent.match(/firefox|fxios/i)) {
    browserName = "firefox";
  } else if (userAgent.match(/safari/i)) {
    browserName = "safari";
  } else if (userAgent.match(/opr\//i)) {
    browserName = "opera";
  } else if (userAgent.match(/edg/i)) {
    browserName = "edge";
  } else {
    browserName = "No browser detection";
  }

  return (
    <div>
      <pre>{JSON.stringify(info)}</pre>
      <pre>Device ID:{JSON.stringify(visitorData?.visitorId)}</pre>
      <pre>Browser:{browserName}</pre>
    </div>
  );
};

function OrderPageContent({ orderId }: { orderId: number }) {
  const { data, isLoading, isError } = trpc.useQuery([
    "auth.getOrderDetails",
    { orderId },
  ]);
  if (isLoading) return <div>Loading...</div>;
  if (!data) return <div>No order exists!</div>;
  if (isError) return <div>Something went wrong!</div>;

  if (data) {
  }
  return (
    <main className="max-w-2xl mx-auto pt-8 pb-24 sm:pt-16 sm:px-6 lg:max-w-7xl lg:px-8">
      <div className="px-4 space-y-2 sm:px-0 sm:flex sm:items-baseline sm:justify-between sm:space-y-0">
        <div className="flex sm:items-baseline sm:space-x-4">
          <h1 className="text-2xl font-extrabold tracking-tight text-gray-900 sm:text-3xl">
            Order #{orderId}
          </h1>
        </div>
        <p className="text-sm text-gray-600">
          Order placed{" "}
          <time
            dateTime={data.createdAt.toDateString()}
            className="font-medium text-gray-900"
          >
            {data.createdAt.toDateString()}
          </time>
        </p>
      </div>

      {/* Products */}
      <section aria-labelledby="products-heading" className="mt-6">
        <h2 id="products-heading" className="sr-only">
          Products purchased
        </h2>

        <div className="space-y-8">
          <div className="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg">
            <div className="py-6 px-4 sm:px-6 lg:grid lg:grid-cols-12 lg:gap-x-8 lg:p-8">
              <div className="sm:flex lg:col-span-7">
                <div className="flex-shrink-0 w-full aspect-w-1 aspect-h-1 rounded-lg overflow-hidden sm:aspect-none sm:w-40 sm:h-40">
                  <img
                    src={data.product.images[0]}
                    alt={data.product.name}
                    className="w-full h-full object-center object-cover sm:w-full sm:h-full"
                  />
                </div>

                <div className="mt-6 sm:mt-0 sm:ml-6">
                  <h3 className="text-base font-medium text-gray-900">
                    {data.product.name}
                  </h3>
                  <p className="mt-2 text-sm font-medium text-gray-900">
                    Rs {data.product.price}
                  </p>
                  <p
                    className="mt-3 text-sm text-gray-500"
                    dangerouslySetInnerHTML={{
                      __html: data.product.description,
                    }}
                  />
                </div>
              </div>
            </div>

            <div className="border-t border-gray-200 py-6 px-4 sm:px-6 lg:p-8">
              <h4 className="sr-only">Status</h4>
              <p className="text-sm font-medium text-red-600">{data.status}</p>
            </div>
          </div>
        </div>
      </section>
      {/* <CheckFraudComponent /> */}
    </main>
  );
}

OrderPage.getLayout = function getLayout(page: React.ReactElement) {
  return <Layout>{page}</Layout>;
};
