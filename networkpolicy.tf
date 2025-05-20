resource "kubernetes_network_policy" "default_deny_all_postgres" {
  metadata {
    name      = "deny-all"
    namespace = "postgres"
  }

  spec {
    pod_selector {} # применимо ко всем Pod’ам
    policy_types = ["Ingress"]
  }
}

resource "kubernetes_network_policy" "allow_app_to_postgres" {
  metadata {
    name      = "allow-app-to-postgres"
    namespace = "postgres"
  }

  spec {
    pod_selector {
      match_labels = {
        app = "postgresql" # Убедись, что Pod PostgreSQL имеет эту метку
      }
    }

    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = "pf-namespace-backend"
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
