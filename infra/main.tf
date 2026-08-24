resource "local_file" "bucket_simulado" {
  filename = "${path.root}/bucket-${var.bucket_name}.txt"
  content  = "Bucket local simulado: ${var.bucket_name}"
}