resource "aws_s3_bucket" "example" {
  bucket = format("%s-%s-%s-%s", var.client_name, var.env, var.account_id, var.bucket_sufixx)
  
  tags = {
    Name        = "${var.provisioner}"
    Environment = "${var.env}"
  }
}