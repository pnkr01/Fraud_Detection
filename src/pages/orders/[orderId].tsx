import { useRouter } from "next/router";
import React, { useEffect, useState } from "react";
import Layout from "~/components/layout";
import { useVisitorData } from "@fingerprintjs/fingerprintjs-pro-react";
import { trpc } from "~/utils/trpc";
import { useLocation } from "react-use";

const products = [
  {
    id: 1,
    name: "Nomad Tumbler",
    description:
      "This durable and portable insulated tumbler will keep your beverage at the perfect temperature during your next adventure.",
    href: "#",
    price: "35.00",
    status:
      "Can't process your order further. Your account has been blocked because our system detect it's a fraud transaction.",
    step: 1,
    date: "March 24, 2021",
    datetime: "2021-03-24",
    address: ["Floyd Miles", "7363 Cynthia Pass", "Toronto, ON N3Y 4H8"],
    email: "f•••@example.com",
    phone: "1•••••••••40",
    imageSrc:
      "https://tailwindui.com/img/ecommerce-images/confirmation-page-03-product-01.jpg",
    imageAlt: "Insulated bottle with white base and black snap lid.",
  },
];

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
        setInfo({
          ...info,
          ip: data.ip,
        });
      });
  }, []);

  if (isLoading) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <pre>{JSON.stringify(info)}</pre>
      <pre>{JSON.stringify(visitorData)}</pre>
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
      <CheckFraudComponent />
    </main>
  );
}

OrderPage.getLayout = function getLayout(page: React.ReactElement) {
  return <Layout>{page}</Layout>;
};
