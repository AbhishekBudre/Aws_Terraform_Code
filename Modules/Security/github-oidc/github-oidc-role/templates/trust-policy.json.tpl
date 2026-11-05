{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "GitHubActionsAssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Federated": "${oidc_provider_arn}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": [
            "repo:${github_owner}/${github_repository}:ref:refs/heads/${github_branch}",
            "repo:${github_owner}/${github_repository}:environment:${github_environment}"
          ]
        }
      }
    }
  ]
}