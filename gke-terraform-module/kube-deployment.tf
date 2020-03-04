provider "kubernetes" {
  host                   = "${google_container_cluster.self_learn_gke.endpoint}"
  token                  = "${data.google_client_config.current.access_token}"
  client_certificate     = "${base64decode(google_container_cluster.self_learn_gke.master_auth.0.client_certificate)}"
  client_key             = "${base64decode(google_container_cluster.self_learn_gke.master_auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.self_learn_gke.master_auth.0.cluster_ca_certificate)}"
}

resource "kubernetes_namespace" "frontend" {
  metadata {
    name = "frontend"
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    namespace = "${kubernetes_namespace.frontend.metadata.0.name}"
    name      = "nginx"
  }

  spec {
    selector = {
      run = "nginx"
    }

    session_affinity = "ClientIP"

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }

    type             = "LoadBalancer"
  }
}

resource "kubernetes_replication_controller" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "${kubernetes_namespace.frontend.metadata.0.name}"

    labels = {
      run = "nginx"
    }
  }

  spec {
    selector = {
      run = "nginx"
    }

    template {
      metadata {
        labels = {
          run = "nginx"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }

            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
