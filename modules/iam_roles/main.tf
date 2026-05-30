############################################
# TRUST POLICY DOCUMENT
############################################

data "aws_iam_policy_document" "assume_role_policy" {

  for_each = var.iam_roles

  statement {

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = [each.value.service]
    }

    actions = ["sts:AssumeRole"]
  }
}

############################################
# CREATE IAM ROLES
############################################

resource "aws_iam_role" "roles" {

  for_each = var.iam_roles

  name = each.value.role_name

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[each.key].json
}

############################################
# FLATTEN POLICY ATTACHMENTS
############################################

locals {

  role_policy_attachments = flatten([

    for role_key, role_value in var.iam_roles : [

      for policy_arn in role_value.policies : {

        role_key   = role_key
        policy_arn = policy_arn
      }
    ]
  ])
}

############################################
# ATTACH POLICIES
############################################

resource "aws_iam_role_policy_attachment" "attachments" {

  for_each = {

    for attachment in local.role_policy_attachments :

    "${attachment.role_key}-${attachment.policy_arn}" => attachment
  }

  role       = aws_iam_role.roles[each.value.role_key].name
  policy_arn = each.value.policy_arn
}