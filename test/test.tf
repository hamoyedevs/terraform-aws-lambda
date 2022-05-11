module "aws_lambda" {
  source = "github.com/CoterieAI/terraform-aws-lambda"

  function_name    = var.function_name
  filename         = var.filename
  function_handler = var.function_handler
  timeout          = var.timeout
  role_name        = var.role_name
  runtime          = var.runtime
  lambda_variables = {
    URL   = "https.google.com",
    SPORT = "football"
  }

  layer_arn = [var.layer_arn]
}
