import React from "react";
import { ButtonLink } from "./button-link";

type CardProps = {
  name: string | null;
  description: string | null;
  clientId: string | null;
  clientSecret: string | null;
};

export default function Card({
  name,
  description,
  clientId,
  clientSecret,
}: CardProps) {
  return (
    <div className="max-w-full bg-white rounded-lg border border-gray-200 shadow-sm">
      <div className="p-5">
        <h5 className="mb-2 text-2xl font-bold tracking-tight text-gray-900 ">
          {name}
        </h5>

        <p className="mb-3 font-normal text-gray-700">{description}</p>

        <div className="border-y py-2 my-2">
          <div>
            <h2 className="font-semibold">Client Id</h2>
            <p>{clientId}</p>
          </div>
          <div>
            <h2 className="font-semibold">Client Secret</h2>
            <p>{clientSecret}</p>
          </div>
        </div>
        <ButtonLink href="/" variant="danger">
          Delete app
        </ButtonLink>
      </div>
    </div>
  );
}
