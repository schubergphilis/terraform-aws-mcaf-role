# terraform-aws-mcaf-role

A Terraform module that creates an IAM role.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.78.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_policy"></a> [assume\_policy](#input\_assume\_policy) | The assume policy to attach to the role | `string` | `null` | no |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Overrule whether the IAM role policy has to be created | `bool` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the role | `string` | `null` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Force detaching any policies the role has before destroying it | `bool` | `false` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | The maximum session duration (in seconds) for the role | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the role.  Conflicts with `name_prefix`. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique role and policy name beginning with the specified prefix. Conflicts with `name`. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | Path to the role | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The permissions boundary to set on the role | `string` | `null` | no |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | A set of policy ARNs to attach to the user | `set(string)` | `[]` | no |
| <a name="input_postfix"></a> [postfix](#input\_postfix) | Postfix the role and policy names with Role and Policy | `bool` | `true` | no |
| <a name="input_principal_identifiers"></a> [principal\_identifiers](#input\_principal\_identifiers) | List of identifiers for principals | `list(string)` | `[]` | no |
| <a name="input_principal_type"></a> [principal\_type](#input\_principal\_type) | The type of assume role principal | `string` | `""` | no |
| <a name="input_role_policy"></a> [role\_policy](#input\_role\_policy) | The IAM policy to attach to the role | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the role | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the role |
| <a name="output_id"></a> [id](#output\_id) | ID of the role |
| <a name="output_name"></a> [name](#output\_name) | The name of the role |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | Unique ID of the role |
<!-- END_TF_DOCS -->
