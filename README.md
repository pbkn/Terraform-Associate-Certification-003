# Terraform-Associate-Certification-003
Terraform practice for "HashiCorp Certified: Terraform Associate (003)"

AWS setup for Terraform Cloud dynamic login:
https://aws.amazon.com/blogs/apn/simplify-and-secure-terraform-workflows-on-aws-with-dynamic-provider-credentials/

Github setup for Terraform Cloud dynamic login:
https://nakamasato.medium.com/how-to-start-managing-github-repository-and-branch-protection-by-terraform-a7a1ae24d8b

The following ENV variables need to be setup in Terraform Cloud -> Workspace:
- GITHUB_TOKEN : "Github token"
- TFC_AWS_APPLY_ROLE_ARN : "AWS ROLE arn associated with iDp provider and trust policy"
- TFC_AWS_PLAN_ROLE_ARN : "AWS ROLE arn associated with iDp provider and trust policy"
- TFC_AWS_PROVIDER_AUTH : true
- TFC_AWS_RUN_ROLE_ARN : "AWS ROLE arn associated with iDp provider and trust policy"
