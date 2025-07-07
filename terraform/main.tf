provider "aws" {
  region = "ap-south-1"
}

resource "aws_lambda_function" "appointment-service" {
  function_name = "appointment-service"
  filename      = "${path.module}/appointment-service.zip"
  source_code_hash = filebase64sha256("${path.module}/appointment-service.zip")
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  role          = devops-role
}

resource "aws_lambda_function" "patient-service" {
  function_name = "patient-service"
  filename      = "${path.module}/patient-service.zip"
  source_code_hash = filebase64sha256("${path.module}/patient-service.zip")
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  role          = devops-role
}

