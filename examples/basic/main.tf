provider "aws" {
  region = "eu-west-1"
}

module "example_role" {
  source = "../.."

  name_prefix = "Example"
  policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
