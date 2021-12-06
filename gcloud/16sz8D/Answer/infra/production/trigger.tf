resource "google_cloudbuild_trigger" "apigateway-push" {
  substitutions = {
    _SERVICE = "APIGateway"
    _ENVIRONMENT = "production"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    push {
      tag = ".*"
    }
  }

  included_files = ["APIGateway/**"]
  filename       = "cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "ordersvc-push" {
  substitutions = {
    _SERVICE = "OrderService"
    _ENVIRONMENT = "production"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    push {
      tag = ".*"
    }
  }

  included_files = ["OrderService/**"]
  filename       = "cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "productsvc-push" {
  substitutions = {
    _SERVICE = "ProductService"
    _ENVIRONMENT = "production"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    push {
      tag = ".*"
    }
  }

  included_files = ["ProductService/**"]
  filename       = "cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "usersvc-push" {
  substitutions = {
    _SERVICE = "UserService"
    _ENVIRONMENT = "production"
  }

  github {
    owner = var.github_owner
    name  = var.github_repository
    push {
      tag = ".*"
    }
  }

  included_files = ["UserService/**"]
  filename       = "cloudbuild.yaml"
}
