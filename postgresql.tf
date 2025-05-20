resource "helm_release" "postgresql" {
  name       = "pg"
  namespace  = kubernetes_namespace.postgres.metadata[0].name
  chart      = "${path.module}/charts/postgresql"

  values = [
    file("${path.module}/charts/postgresql/values.yaml")
  ]
}
