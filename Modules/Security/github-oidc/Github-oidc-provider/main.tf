#############################################################
# GITHUB CERTIFICATE
#############################################################

data "tls_certificate" "github" {

  url = var.oidc_provider_url

}

#############################################################
# GITHUB OIDC PROVIDER
#############################################################

resource "aws_iam_openid_connect_provider" "github" {

  url = var.oidc_provider_url

  client_id_list = var.client_id_list

  #   thumbprint_list = [

  #     data.tls_certificate.github.certificates[0].sha1_fingerprint

  #   ]

  tags = merge(

    var.common_tags,

    {

      Name = "GitHub-OIDC-Provider"

    }

  )

}