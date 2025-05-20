resource "kubernetes_network_policy" "allow_app_to_postgres" {
  metadata {
    name      = "allow-app-to-postgres"
    namespace = "postgres"
  }

  spec {
    pod_selector {
      match_labels = {
        app = "pg"
      }
    }

    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = "pf-backend"
          }
        }

        pod_selector {
          match_labels = {
            app = "pf-app-backend"
          }
        }
      }

      ports {
        protocol = "TCP"
        port     = 5432
      }
    }

    policy_types = ["Ingress"]
  }
}
