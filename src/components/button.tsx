import { classNames } from "~/utils/classnames";
import * as React from "react";
import { Icon } from "@iconify/react";
import spinnerIos20Filled from "@iconify/icons-fluent/spinner-ios-20-filled";

export type ButtonVariant = "primary" | "secondary" | "danger";

type ButtonProps = {
  variant?: ButtonVariant;
  responsive?: boolean;
  isLoading?: boolean;
  loadingChildren?: React.ReactNode;
} & React.ComponentPropsWithoutRef<"button">;

export function buttonClasses({
  className,
  variant = "primary",
  isLoading,
  disabled,
}: ButtonProps) {
  return classNames(
    "inline-flex items-center justify-center px-4 py-2 border text-sm font-medium rounded-md shadow-sm",
    variant === "primary" &&
      "border-transparent text-white bg-slate-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-slate-500",
    variant === "primary" && !isLoading && "hover:bg-slate-700",
    variant === "secondary" && "border-slate-300 text-slate-700 bg-white ",
    variant === "danger" && "border-transparent text-white bg-red-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 ",
    variant === "secondary" && !isLoading && "hover:bg-slate-50",
    (disabled || isLoading) && "opacity-50 cursor-default",
    className
  );
}

export const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  (
    {
      className,
      variant = "primary",
      responsive,
      type = "button",
      isLoading = false,
      loadingChildren,
      disabled,
      children,
      ...rest
    },
    forwardedRef
  ) => {
    return (
      <button
        {...rest}
        ref={forwardedRef}
        type={type}
        disabled={disabled || isLoading}
        className={buttonClasses({
          className,
          disabled,
          variant,
          responsive,
          isLoading,
        })}
      >
        {isLoading && (
          <Icon
            icon={spinnerIos20Filled}
            className="w-4 h-4 mr-2 -ml-1 animate-spin"
          />
        )}
        {isLoading && loadingChildren ? loadingChildren : children}
      </button>
    );
  }
);

Button.displayName = "Button";
