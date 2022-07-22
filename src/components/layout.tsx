import Head from "next/head";
import React from "react";
import { Button } from "./button";

type DefaultLayoutProps = { children: React.ReactNode };

export default function Layout({ children }: DefaultLayoutProps) {
  return (
    <div className="min-h-screen bg-gray-100">
      <Head>
        <title>Fraud Auth</title>
        <meta name="description" content="Create apps for using our api" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <header className="max-w-5xl mx-auto px-4 py-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center border-b pb-4">
          <h1 className="text-xl font-bold text-indigo-700 uppercase">
            Fraud Auth App
          </h1>
          <Button>Sign out</Button>
        </div>
      </header>
      <main className="max-w-5xl mx-auto px-4 py-8 sm:px-6 lg:px-8">
        {children}
      </main>
      <footer></footer>
    </div>
  );
}
