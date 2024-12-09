# To destroy a specific resource, we use terraform destroy --target <resource-type>.<resource-name> 
# In this case, terraform destroy --target github_repository.terraform-repository

# terraform validate checks if the configuration is valid or not

provider "github" {
    token = "***"
}   

resource "github_repository" "terraform-repository" {
    name = "terraform"
    description = "Created using Terraform for practice."

    visibility = "public"

    auto_init = true
}