resource "kubernetes_namespace" "postgres" {
  metadata {
    name = "postgres"
  }
}

resource "kubernetes_namespace" "pf-namespace-backend" {
  metadata {
    name = "pf-namespace-backend"
  }
}
