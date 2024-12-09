output "thekeyoutput" {
  value = aws_key_pair.thekeypair.key_pair_id
}

output "theamioutput" {
  value = data.aws_ami.theami.id
}