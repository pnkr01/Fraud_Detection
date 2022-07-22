import { useSession } from "next-auth/react";
import React from "react";

export default function NewApp() {
  const { data: session } = useSession();
  if (!session) {
    return;
  }
  return (
    <div className="container mx-auto min-h-screen max-w-4xl p-4">
      <h2 className="text-2xl font-bold">Register a new OAuth application</h2>
      <div className="mt-8 max-w-lg">
        <div className="grid grid-cols-1 gap-6">
          <label className="block">
            <span className="text-gray-700">Application name</span>
            <input
              type="text"
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
              placeholder=""
            />
          </label>

          <label className="block">
            <span className="text-gray-700">Application description</span>
            <textarea
              className=" mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
              rows={3}
            ></textarea>
          </label>
          <div className="block">
            <button className="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
              Register application
            </button>
            <button className="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
              Cancel
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
