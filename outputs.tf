output "vpc_id" {
  value = aws_vpc.default.id

}

output "subnet1_id" {
  value = aws_subnet.subnet1-public.id
}

output "subnet2_id" {
  value = aws_subnet.subnet2-public.id
}

output "subnet3_id" {
  value = aws_subnet.subnet3-public.id

}

output "subnet4_id" {
  value = aws_subnet.subnet4-public.id

}

output "securitygroups" {
  value = aws_security_group.allow_all.id

}

output "DynamoDB_Details_id" {
  value = aws_dynamodb_table.devops-terraform-state-lock-dynamo.id

}