output "name" {
  value = data.github_repository.terraform-repository.ssh_clone_url
}

output "content" {
  value = data.github_repository_file.readme
}