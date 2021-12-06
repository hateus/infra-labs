resource "google_cloudbuild_trigger" "apigateway-pr" {
  substitutions = {
    _SERVICE = "APIGateway"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      comment_control = "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY"
      branch = ".*"
    }
  }

  included_files = ["APIGateway/**"]
  filename       = "cloudbuild-pr.yaml"
}

resource "google_cloudbuild_trigger" "ordersvc-pr" {
  substitutions = {
    _SERVICE = "OrderService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      comment_control = "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY"
      branch = ".*"
    }
  }

  included_files = ["OrderService/**"]
  filename       = "cloudbuild-pr.yaml"
}

resource "google_cloudbuild_trigger" "productsvc-pr" {
  substitutions = {
    _SERVICE = "ProductService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      comment_control = "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY"
      branch = ".*"
    }
  }

  included_files = ["ProductService/**"]
  filename       = "cloudbuild-pr.yaml"
}

resource "google_cloudbuild_trigger" "usersvc-pr" {
  substitutions = {
    _SERVICE = "UserService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      comment_control = "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY"
      branch = ".*"
    }
  }

  included_files = ["UserService/**"]
  filename       = "cloudbuild-pr.yaml"
}
