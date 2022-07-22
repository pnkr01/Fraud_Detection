import { classNames } from "~/utils/classnames";
import * as React from "react";

export type TextFieldOwnProps = {
  label?: string;
  helperText?: string;
};

type TextFieldProps = TextFieldOwnProps &
  React.ComponentPropsWithoutRef<"input">;

export const TextField = React.forwardRef<HTMLInputElement, TextFieldProps>(
  (
    { label, helperText, id, name, type = "text", className, ...rest },
    forwardedRef
  ) => {
    return (
      <div>
        <div>
          {label && (
            <label
              htmlFor={id || name}
              className="block font-medium text-md text-gray-700"
            >
              {label}
            </label>
          )}
          {helperText && <p className="text-sm text-gray-500">{helperText}</p>}
        </div>
        <input
          {...rest}
          ref={forwardedRef}
          id={id || name}
          name={name}
          type={type}
          className={classNames(
            "mt-1 focus:ring-sky-500 focus:border-sky-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md",
            className
          )}
        />
      </div>
    );
  }
);

TextField.displayName = "TextField";
