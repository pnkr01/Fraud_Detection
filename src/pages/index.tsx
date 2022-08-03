import { Disclosure, RadioGroup, Tab } from "@headlessui/react";
import {
  HeartIcon,
  MinusSmIcon,
  PlusSmIcon,
  PlusIcon,
  MinusIcon,
} from "@heroicons/react/outline";
import { StarIcon } from "@heroicons/react/solid";
import { useRouter } from "next/router";
import { useState } from "react";
import { Button } from "~/components/button";
import { ButtonLink } from "~/components/button-link";
import Layout from "~/components/layout";
import { classNames } from "~/utils/classnames";
import { trpc } from "~/utils/trpc";
import { NextPageWithAuthAndLayout } from "~/utils/types";

const product = {
  name: "Apple iPhone 13",
  price: 299,
  rating: 4,
  images: [
    {
      id: 1,
      name: "Front",
      src: "https://m.media-amazon.com/images/I/71GLMJ7TQiL._SX679_.jpg",
      alt: "Front",
    },
    {
      id: 2,
      name: "Side",
      src: "https://m.media-amazon.com/images/I/61NTwRtdzfL._SX679_.jpg",
      alt: "Side",
    },
    {
      id: 3,
      name: "Variant",
      src: "https://m.media-amazon.com/images/I/81edi2EvglL._SX679_.jpg",
      alt: "Variant",
    },
  ],
  colors: [
    {
      name: "Washed Black",
      bgColor: "bg-gray-700",
      selectedColor: "ring-gray-700",
    },
    { name: "White", bgColor: "bg-white", selectedColor: "ring-gray-400" },
    {
      name: "Washed Gray",
      bgColor: "bg-gray-500",
      selectedColor: "ring-gray-500",
    },
  ],
  description: `
    <p>Every iPhone you buy from us is unlocked. Your new iPhone will work with your network provider, so you won’t have to change your plan or phone number. Once your new iPhone is activated, it remains unlocked, which means that at any time you can decide to switch to any network that provides service for iPhone.</p>
  `,
  details: [
    {
      name: "Features",
      items: [
        "(6.7″) Super Retina XDR display with ProMotion",
        "5G capable",
        "Telephoto",
        "Wide",
        "Ultra Wide",
        "Cinematic mode in 1080p at 30 fps",
        "Dolby Vision HDR video recording up to 4K at 60 fps",
        "LiDAR Scanner for Night mode portraits, faster autofocus in low light and next-level AR experiences",
        "A15 Bionic chip",
        "New 6-core CPU with 2 performance and 4 efficiency cores",
        "New 5-core GPU",
        "New 16-core Neural Engine",
      ],
    },
  ],
};

const Home: NextPageWithAuthAndLayout = () => {
  const [count, setCount] = useState(1);
  const [selectedColor, setSelectedColor] = useState(product.colors[0]);
  const {
    data: relatedProducts,
    isLoading,
    isError,
  } = trpc.useQuery(["auth.getAllProducts"]);

  const placeOrderMutation = trpc.useMutation("auth.placeOrder", {
    onError: (error) => {
      alert(`Something went wrong: ${error.message}`);
    },
  });

  const router = useRouter();

  if (isLoading && !relatedProducts)
    return (
      <div className="my-36 p-4 max-w-sm text-center w-full mx-auto">
        Loading...
      </div>
    );

  if (!isLoading && isError) return <div>Something went wrong!</div>;

  return (
    <>
      <main className="max-w-7xl mx-auto sm:pt-16 sm:px-6 lg:px-8">
        <div className="max-w-2xl mx-auto lg:max-w-none">
          {/* Product */}
          <div className="lg:grid lg:grid-cols-2 lg:gap-x-8 lg:items-start">
            {/* Image gallery */}
            <Tab.Group as="div" className="flex flex-col-reverse">
              {/* Image selector */}
              <div className="hidden mt-6 w-full max-w-2xl mx-auto sm:block lg:max-w-none">
                <Tab.List className="grid grid-cols-4 gap-6">
                  {product.images.map((image) => (
                    <Tab
                      key={image.id}
                      className="relative h-24 bg-white rounded-md flex items-center justify-center text-sm font-medium uppercase text-gray-900 cursor-pointer hover:bg-gray-50 focus:outline-none focus:ring focus:ring-offset-4 focus:ring-opacity-50"
                    >
                      {({ selected }: any) => (
                        <>
                          <span className="sr-only">{image.name}</span>
                          <span className="absolute inset-0 rounded-md overflow-hidden">
                            <img
                              src={image.src}
                              alt=""
                              className="w-full h-full object-center object-cover"
                            />
                          </span>
                          <span
                            className={classNames(
                              selected ? "ring-orange-500" : "ring-transparent",
                              "absolute inset-0 rounded-md ring-2 ring-offset-2 pointer-events-none"
                            )}
                            aria-hidden="true"
                          />
                        </>
                      )}
                    </Tab>
                  ))}
                </Tab.List>
              </div>

              <Tab.Panels className="w-full aspect-w-1 aspect-h-1">
                {product.images.map((image) => (
                  <Tab.Panel key={image.id}>
                    <img
                      src={image.src}
                      alt={image.alt}
                      className="w-full h-full object-center object-cover sm:rounded-lg"
                    />
                  </Tab.Panel>
                ))}
              </Tab.Panels>
            </Tab.Group>

            {/* Product info */}
            <div className="mt-10 px-4 sm:px-0 sm:mt-16 lg:mt-0">
              <h1 className="text-3xl font-extrabold tracking-tight text-gray-900">
                {product.name}
              </h1>

              <div className="mt-3">
                <h2 className="sr-only">Product information</h2>
                <p className="text-3xl text-gray-900">
                  {new Intl.NumberFormat("en-US", {
                    style: "currency",
                    currency: "USD",
                    minimumFractionDigits: 0,
                  }).format(product.price * count)}
                </p>
              </div>

              {/* Reviews */}
              <div className="mt-3">
                <h3 className="sr-only">Reviews</h3>
                <div className="flex items-center">
                  <div className="flex items-center">
                    {[0, 1, 2, 3, 4].map((rating) => (
                      <StarIcon
                        key={rating}
                        className={classNames(
                          product.rating > rating
                            ? "text-orange-500"
                            : "text-gray-300",
                          "h-5 w-5 flex-shrink-0"
                        )}
                        aria-hidden="true"
                      />
                    ))}
                  </div>
                  <p className="sr-only">{product.rating} out of 5 stars</p>
                </div>
              </div>

              <div className="mt-6">
                <h3 className="sr-only">Description</h3>

                <div
                  className="text-base text-gray-700 space-y-6"
                  dangerouslySetInnerHTML={{ __html: product.description }}
                />
              </div>

              <form className="mt-6">
                {/* Colors */}
                <div>
                  <h3 className="text-sm text-gray-600">Color</h3>

                  <RadioGroup
                    value={selectedColor}
                    onChange={setSelectedColor}
                    className="mt-2"
                  >
                    <RadioGroup.Label className="sr-only">
                      Choose a color
                    </RadioGroup.Label>
                    <div className="flex items-center space-x-3">
                      {product.colors.map((color) => (
                        <RadioGroup.Option
                          key={color.name}
                          value={color}
                          className={({ active, checked }) =>
                            classNames(
                              color.selectedColor,
                              active && checked ? "ring ring-offset-1" : "",
                              !active && checked ? "ring-2" : "",
                              "-m-0.5 relative p-0.5 rounded-full flex items-center justify-center cursor-pointer focus:outline-none"
                            )
                          }
                        >
                          <RadioGroup.Label as="p" className="sr-only">
                            {color.name}
                          </RadioGroup.Label>
                          <span
                            aria-hidden="true"
                            className={classNames(
                              color.bgColor,
                              "h-8 w-8 border border-black border-opacity-10 rounded-full"
                            )}
                          />
                        </RadioGroup.Option>
                      ))}
                    </div>
                  </RadioGroup>
                </div>

                <div className="mt-10 flex sm:flex-col1">
                  <button
                    disabled={count == 1}
                    type="button"
                    className="mr-4 py-3 px-3 rounded-md flex items-center justify-center text-gray-400 hover:bg-gray-100 hover:text-gray-500"
                    onClick={() => {
                      if (count > 1) setCount(count - 1);
                    }}
                  >
                    <MinusIcon
                      className="h-6 w-6 flex-shrink-0"
                      aria-hidden="true"
                    />
                    <span className="sr-only">Add items</span>
                  </button>
                  <Button
                    className="max-w-xs sm:w-full"
                    onClick={() => {
                      if (relatedProducts !== undefined) {
                        const productId = relatedProducts[0]?.id || "";
                        placeOrderMutation.mutate(
                          {
                            productId: productId,
                            count: count,
                          },
                          {
                            onSuccess: (data) =>
                              router.push(`/orders/${data.id}`),
                          }
                        );
                      }
                    }}
                    isLoading={placeOrderMutation.isLoading}
                  >
                    Buy now ({count})
                  </Button>

                  <button
                    type="button"
                    className="ml-4 py-3 px-3 rounded-md flex items-center justify-center text-gray-400 hover:bg-gray-100 hover:text-gray-500"
                    onClick={() => {
                      setCount(count + 1);
                    }}
                  >
                    <PlusIcon
                      className="h-6 w-6 flex-shrink-0"
                      aria-hidden="true"
                    />
                    <span className="sr-only">Add items</span>
                  </button>
                </div>
              </form>

              <section aria-labelledby="details-heading" className="mt-12">
                <h2 id="details-heading" className="sr-only">
                  Additional details
                </h2>

                <div className="border-t divide-y divide-gray-200">
                  {product.details.map((detail) => (
                    <Disclosure as="div" key={detail.name}>
                      {({ open }) => (
                        <>
                          <h3>
                            <Disclosure.Button className="group relative w-full py-6 flex justify-between items-center text-left">
                              <span
                                className={classNames(
                                  open ? "text-orange-600" : "text-gray-900",
                                  "text-sm font-medium"
                                )}
                              >
                                {detail.name}
                              </span>
                              <span className="ml-6 flex items-center">
                                {open ? (
                                  <MinusSmIcon
                                    className="block h-6 w-6 text-orange-400 group-hover:text-orange-500"
                                    aria-hidden="true"
                                  />
                                ) : (
                                  <PlusSmIcon
                                    className="block h-6 w-6 text-gray-400 group-hover:text-gray-500"
                                    aria-hidden="true"
                                  />
                                )}
                              </span>
                            </Disclosure.Button>
                          </h3>
                          <Disclosure.Panel
                            as="div"
                            className="pb-6 prose prose-sm"
                          >
                            <ul role="list">
                              {detail.items.map((item) => (
                                <li key={item}>{item}</li>
                              ))}
                            </ul>
                          </Disclosure.Panel>
                        </>
                      )}
                    </Disclosure>
                  ))}
                </div>
              </section>
            </div>
          </div>

          <section
            aria-labelledby="related-heading"
            className="mt-10 border-t border-gray-200 py-16 px-4 sm:px-0"
          >
            <h2
              id="related-heading"
              className="text-xl font-bold text-gray-900"
            >
              Customers also bought
            </h2>

            <div className="mt-8 grid grid-cols-1 gap-y-12 sm:grid-cols-2 sm:gap-x-6 lg:grid-cols-4 xl:gap-x-8">
              {relatedProducts?.slice(1).map((product) => (
                <div key={product.id}>
                  <div className="relative">
                    <div className="relative w-full h-72 rounded-lg overflow-hidden">
                      <img
                        src={product.images[0]}
                        alt={product.name}
                        className="w-full h-full object-center object-cover"
                      />
                    </div>
                    <div className="relative mt-4">
                      <h3 className="text-sm font-medium text-gray-900">
                        {product.name}
                      </h3>
                      <div className="mt-1 flex">
                        {[0, 1, 2, 3, 4].map((rating) => (
                          <StarIcon
                            key={rating}
                            className={classNames(
                              product.rating > rating
                                ? "text-orange-500"
                                : "text-gray-300",
                              "h-5 w-5 flex-shrink-0"
                            )}
                            aria-hidden="true"
                          />
                        ))}
                      </div>
                    </div>
                    <div className="absolute top-0 inset-x-0 h-72 rounded-lg p-4 flex items-end justify-end overflow-hidden">
                      <div
                        aria-hidden="true"
                        className="absolute inset-x-0 bottom-0 h-36 bg-gradient-to-t from-black opacity-50"
                      />
                      <p className="relative text-lg font-semibold text-white">
                        {new Intl.NumberFormat("en-US", {
                          style: "currency",
                          currency: "USD",
                          minimumFractionDigits: 0,
                        }).format(Number(product.price))}
                      </p>
                    </div>
                  </div>
                  <div className="mt-6">
                    <Button
                      variant="secondary"
                      className="w-full"
                      onClick={() => {
                        if (relatedProducts !== undefined) {
                          const productId = product.id;
                          placeOrderMutation.mutate(
                            {
                              productId: productId,
                              count: 1,
                            },
                            {
                              onSuccess: (data) =>
                                router.push(`/orders/${data.id}`),
                            }
                          );
                        }
                      }}
                    >
                      Buy now
                    </Button>
                  </div>
                </div>
              ))}
            </div>
          </section>
        </div>
      </main>
    </>
  );
};

export default Home;

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <Layout>{page}</Layout>;
};
