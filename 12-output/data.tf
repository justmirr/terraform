# To get the value of a specific output block, use terraform output <output-name>
data "github_repository" "terraform-repository" {
  name = "terraform"
}

data "github_repository_file" "readme" {
  repository = data.github_repository.terraform-repository.name
  file       = "README.md"
}
