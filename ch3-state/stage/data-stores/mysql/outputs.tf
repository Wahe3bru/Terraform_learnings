output "address" {
  description = "database endpoint"
  value = aws_db_instance.example.address
}

ouput "port" {
  description = "port database is listening on"
  value = aws_db_instance.example.port
}
