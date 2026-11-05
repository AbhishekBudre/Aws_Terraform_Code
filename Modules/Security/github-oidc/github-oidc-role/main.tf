#############################################################
# IAM ROLE
#############################################################

resource "aws_iam_role" "this" {

  name = var.role_name

  assume_role_policy = templatefile(

    "${path.module}/templates/trust-policy.json.tpl",

    {
      oidc_provider_arn  = var.oidc_provider_arn
      github_owner       = var.github_owner
      github_repository  = var.github_repository
      github_branch      = var.github_branch
      github_environment = var.github_environment
    }
  )

  tags = merge(

    var.common_tags,

    {

      Name = var.role_name

    }

  )

}

#############################################################
# IAM POLICY
#############################################################

resource "aws_iam_policy" "this" {

  name = var.policy_name

  policy = file(var.policy_template_file)

  tags = merge(

    var.common_tags,

    {

      Name = var.policy_name

    }

  )

}

#############################################################
# ATTACH POLICY
#############################################################

resource "aws_iam_role_policy_attachment" "this" {

  role = aws_iam_role.this.name

  policy_arn = aws_iam_policy.this.arn

}