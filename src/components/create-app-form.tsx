import React from "react";
import { SubmitHandler, useForm } from "react-hook-form";
import { Button } from "~/components/button";
import { ButtonLink } from "~/components/button-link";
import { Textarea } from "~/components/textarea";
import { TextField } from "~/components/textfield";

type FormData = {
  name: string;
  description: string;
};

type PostFormProps = {
  defaultValues?: FormData;
  isSubmitting?: boolean;
  backTo: string;
  onSubmit: SubmitHandler<FormData>;
};

export default function CreateAppForm({
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
              <TextField
                {...register("name", { required: true })}
                label="Name"
                helperText="Good things always start with a good name"
                autoFocus
                required
              />
            </div>
          </div>

          <div>
            <Textarea
              {...register("description", { required: true })}
              label="Application description"
              helperText="Tell us why do you want this app"
              rows={12}
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
              Register application
            </Button>
            <ButtonLink href={backTo} variant="secondary">
              Cancel
            </ButtonLink>
          </div>
        </div>
      </div>
    </form>
  );
}
