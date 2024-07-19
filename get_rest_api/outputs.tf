output "api_gateway_invoke_url" {
  description = "Invoke URL for the API Gateway"
  value       = "https://${data.aws_api_gateway_rest_api.example.id}.execute-api.ca-central-1.amazonaws.com"
}