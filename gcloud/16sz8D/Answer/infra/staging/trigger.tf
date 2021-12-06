resource "google_cloudbuild_trigger" "apigateway-trigger" {
  substitutions = {
    _SERVICE = "APIGateway"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      branch = ".*"
    }
  }

  included_files = ["APIGateway/**"]
  filename       = "cloudbuild-pr.yaml"
}

resource "google_cloudbuild_trigger" "ordersvc-trigger" {
  substitutions = {
    _SERVICE = "OrderService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      branch = ".*"
    }
  }

  included_files = ["OrderService/**"]
  filename       = "cloudbuild-pr.yaml"
}

resource "google_cloudbuild_trigger" "productsvc-trigger" {
  substitutions = {
    _SERVICE = "ProductService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      branch = ".*"
    }
  }

  included_files = ["ProductService/**"]
  filename       = "cloudbuild-pr.yaml"
}

resource "google_cloudbuild_trigger" "usersvc-trigger" {
  substitutions = {
    _SERVICE = "UserService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      branch = ".*"
    }
  }

  included_files = ["UserService/**"]
  filename       = "cloudbuild-pr.yaml"
}
