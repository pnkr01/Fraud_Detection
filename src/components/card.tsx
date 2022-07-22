import React from "react";
import { ButtonLink } from "./button-link";

type CardProps = {
  name: String;
  description: String;
};

export default function Card({ name, description }: CardProps) {
  return (
    <div className="max-w-full bg-white rounded-lg border border-gray-200 shadow-sm">
      <div className="p-5">
        <a href="#">
          <h5 className="mb-2 text-2xl font-bold tracking-tight text-gray-900 ">
            {name}
          </h5>
        </a>
        <p className="mb-3 font-normal text-gray-700">{description}</p>
        <ButtonLink href="/" variant="secondary">
          View
        </ButtonLink>
      </div>
    </div>
  );
}
