variable "runtime" {
  description = "The runtime the Lambda function should run in. A list of all available runtimes can be found here: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html"
  type        = string
  default     = "nodejs12.x"
}


variable "filename" {
  description = "The path to the local .zip file that contains the Lambda function source code."
  type        = string
}

variable "function_name" {
  description = "A unique name for the Lambda function on AWS. Like: function_1"
  type        = string
}

variable "env_name" {
  description = "Lambda function environment name"
  default     = "dev"
}

variable "function_handler" {
  description = "The function entrypoint in the code. This is the name of the method in the code which receives the event and context parameter when this Lambda function is triggered. e.g: function_1.handler"
  type        = string
}



variable "lambda_variables" {
  description = "Lambda function inputs. Format is { foo = \"bar\" }"
  default     = {}
}

variable "timeout" {
  description = "amount of time for the function to run."
}

variable "role_name" {}
variable "layer_arn" {}
variable "memory_size" {}
