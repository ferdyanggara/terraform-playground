data "aws_api_gateway_rest_api" "example" {
  name = "api-${var.stage}"
}