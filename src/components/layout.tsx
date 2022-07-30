import React from "react";
import Footer from "./footer";
import Header from "./header";

type DefaultLayoutProps = { children: React.ReactNode };
export default function Layout({ children }: DefaultLayoutProps) {
  return (
    <div className="bg-slate-50">
      <Header />
      {children}
      <Footer />
    </div>
  );
}
