resource "google_cloudbuild_trigger" "apigateway" {
  substitutions = {
    _SERVICE = "APIGateway"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      branch = "^master"
    }
  }

  included_files = ["APIGateway/**"]
  filename       = "cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "ordersvc" {
  substitutions = {
    _SERVICE = "OrderService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      branch = "^master"
    }
  }

  included_files = ["OrderService/**"]
  filename       = "cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "productsvc" {
  substitutions = {
    _SERVICE = "ProductService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      branch = "^master"
    }
  }

  included_files = ["ProductService/**"]
  filename       = "cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "usersvc" {
  substitutions = {
    _SERVICE = "UserService"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    pull_request {
      branch = "^master"
    }
  }

  included_files = ["UserService/**"]
  filename       = "cloudbuild.yaml"
}
