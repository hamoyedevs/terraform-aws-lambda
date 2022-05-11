resource "aws_iam_role" "iam_for_lambda" {
  name = var.role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "role"
    }
  ]
}
EOF
}


resource "aws_lambda_function" "lambda_function" {
  filename      = var.filename
  function_name = var.function_name
  handler       = var.function_handler
  role          = aws_iam_role.iam_for_lambda.arn
  timeout       = var.timeout

  # uses the file hash to determine if the lambda function has changed or is the same on the cloud
  source_code_hash = filebase64sha256(var.filename)

  runtime     = var.runtime
  memory_size = var.memory_size

  # input variables for functions are injected to lambda process environment and can be accessed from env in code.
  environment {
    variables = var.lambda_variables
  }

  layers = var.layer_arn
}

