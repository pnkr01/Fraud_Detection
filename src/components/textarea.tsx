import { classNames } from '~/utils/classnames';
import * as React from 'react';

export type TextareaOwnProps = {
  label?: string;
  helperText?: string;
};

type TextareaProps = TextareaOwnProps &
  React.ComponentPropsWithoutRef<'textarea'>;

export const Textarea = React.forwardRef<HTMLTextAreaElement, TextareaProps>(
  ({ label, helperText, id, name, className, ...rest }, forwardedRef) => {
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
        <textarea
          {...rest}
          ref={forwardedRef}
          id={id || name}
          name={name}
          className={classNames(
            'shadow-sm focus:ring-sky-500 focus:border-sky-500 mt-1 block w-full sm:text-sm border border-gray-300 rounded-md',
            className,
          )}
        />
      </div>
    );
  },
);

Textarea.displayName = 'Textarea';
