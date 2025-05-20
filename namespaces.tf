resource "kubernetes_namespace" "postgres" {
  metadata {
    name = "postgres"
  }
}
