import React from "react";
import { SubmitHandler, useForm } from "react-hook-form";
import { Button } from "~/components/button";
import { ButtonLink } from "~/components/button-link";
import { TextField } from "~/components/textfield";

type FormData = {
  age: number;
  gender: string;
};

type PostFormProps = {
  defaultValues?: FormData;
  isSubmitting?: boolean;
  backTo: string;
  onSubmit: SubmitHandler<FormData>;
};

export default function AddProfileForm({
  defaultValues,
  isSubmitting,
  backTo,
  onSubmit,
}: PostFormProps) {
  const { register, formState, getValues, reset, handleSubmit } =
    useForm<FormData>({
      defaultValues,
    });

  const { isSubmitSuccessful } = formState;

  React.useEffect(() => {
    if (isSubmitSuccessful) {
      reset(getValues());
    }
  }, [isSubmitSuccessful, reset, getValues]);
  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <div className="shadow sm:rounded-md sm:overflow-hidden">
        <div className="px-4 py-5 bg-white space-y-6 sm:p-6">
          <div className="grid grid-cols-3 gap-6">
            <div className="col-span-full">
              <label
                htmlFor="gender"
                className="block font-medium text-md text-gray-700"
              >
                Gender
              </label>
              <select
                {...register("gender", { required: true })}
                className="mt-1 focus:ring-sky-500 focus:border-sky-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
              >
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="prefer-not-to-say">Prefer not to say</option>
                <option value="others">Others</option>
              </select>
            </div>
          </div>

          <div>
            <TextField
              {...register("age", { required: true })}
              label="Age"
              type="number"
              autoFocus
              required
            />
          </div>
        </div>
        <div className="px-4 py-3 bg-gray-50 text-right sm:px-6">
          <div className="flex flex-row-reverse gap-4">
            <Button
              type="submit"
              isLoading={isSubmitting}
              loadingChildren={`${defaultValues ? "Saving" : "Publishing"}`}
            >
              Proceed
            </Button>
          </div>
        </div>
      </div>
    </form>
  );
}
