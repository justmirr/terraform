resource "aws_s3_bucket" "thebucket" {
  bucket = "happy-bucket123321"
  tags = {
    Name = "happy-bucket123321"
  }
}