import { useRouter } from "next/router";
import React, { useEffect, useState } from "react";
import Layout from "~/components/layout";
import { CheckCircleIcon } from "@heroicons/react/solid";
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

const CheckFraudComponent = ({
  age,
  sex,
  purchase_value,
  signup_time,
  purchase_time,
}: any) => {
  const [ip, setIp] = useState("");
  const { data: visitorData } = useVisitorData();

  const [isLoading, setIsLoading] = useState(true);
  const [data, setData] = useState<any>(null);
  const [error, setError] = useState("");

  useEffect(() => {
    fetch("https://api.ipify.org/?format=json")
      .then((res) => res.json())
      .then((data) => {
        setIp(data.ip);
      });
  }, []);

  useEffect(() => {
    if (ip !== "" && visitorData) {
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
      const data = {
        api_key: "cccad4cc-c158-4aa7-973d-42e4bd1ee306",
        user_id: 0,
        purchase_value,
        sex,
        age,
        signup_time,
        purchase_time,
        source: "direct",
        device_id: visitorData.visitorId,
        ip_address: ip,
      };

      setIsLoading(true);
      fetch("https://fraud-detect.deta.dev/api/predict", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      })
        .then((res) => res.json())
        .then((data) => {
          console.log(data);
          setData(data);
        })
        .catch((err) => {
          console.log(err);
          setError(err.message);
        })
        .finally(() => {
          setIsLoading(false);
        });
    }
  }, [visitorData, ip]);

  if (isLoading) {
    return (
      <div className="rounded-md p-4 w-full mx-auto">
        <div className="animate-pulse flex space-x-4">
          <div className="rounded-full bg-slate-200 h-10 w-10"></div>
          <div className="flex-1 space-y-6 py-1">
            <div className="h-2 bg-slate-200 rounded"></div>
            <div className="space-y-3">
              <div className="grid grid-cols-3 gap-4">
                <div className="h-2 bg-slate-200 rounded col-span-2"></div>
                <div className="h-2 bg-slate-200 rounded col-span-1"></div>
              </div>
              <div className="h-2 bg-slate-200 rounded"></div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (data.score >= 0 && data.score <= 3) {
    return (
      <div>
        <div className="rounded-md bg-green-50 p-4">
          <div className="flex">
            <div className="flex-shrink-0">
              <CheckCircleIcon
                className="h-5 w-5 text-green-400"
                aria-hidden="true"
              />
            </div>
            <div className="ml-3">
              <h3 className="text-sm font-medium text-green-800">
                Order placed, looks good!
              </h3>
              <div className="mt-2 text-sm text-green-700">
                <p>Now you can proceed to checkout.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  } else if (data.score > 3 && data.score <= 7) {
    return (
      <div>
        <div className="rounded-md bg-yellow-50 p-4">
          <div className="flex">
            <div className="flex-shrink-0">
              <CheckCircleIcon
                className="h-5 w-5 text-yellow-400"
                aria-hidden="true"
              />
            </div>
            <div className="ml-3">
              <h3 className="text-sm font-medium text-yellow-800">
                Need Manual Investigation
              </h3>
              <div className="mt-2 text-sm text-yellow-700">
                <p>You are not allowed to proceed to checkout.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
  return (
    <div>
      <div className="rounded-md bg-red-50 p-4">
        <div className="flex">
          <div className="flex-shrink-0">
            <CheckCircleIcon
              className="h-5 w-5 text-red-400"
              aria-hidden="true"
            />
          </div>
          <div className="ml-3">
            <h3 className="text-sm font-medium text-red-800">
              Your transaction has been declined.
            </h3>
            <div className="mt-2 text-sm text-red-700">
              <p>You are not allowed to proceed to checkout.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

function OrderPageContent({ orderId }: { orderId: number }) {
  const { data, isLoading, isError } = trpc.useQuery([
    "auth.getOrderDetails",
    { orderId },
  ]);
  if (isLoading)
    return (
      <div className="my-36 p-4 max-w-sm text-center w-full mx-auto">
        Loading...
      </div>
    );
  if (!data) return <div>No order exists!</div>;
  if (isError) return <div>Something went wrong!</div>;

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
                    {new Intl.NumberFormat("en-IN", {
                      style: "currency",
                      currency: "INR",
                      minimumFractionDigits: 0,
                    }).format(Number(data.  product.price))}
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

              <CheckFraudComponent
                age={data.user.age}
                sex={data.user.gender === "male" ? "M" : "F"}
                purchase_value={data.product.price}
                signup_time={data.user.createdAt.toISOString()}
                purchase_time={data.createdAt.toISOString()}
              />
            </div>
          </div>
        </div>
      </section>
    </main>
  );
}

OrderPage.getLayout = function getLayout(page: React.ReactElement) {
  return <Layout>{page}</Layout>;
};
