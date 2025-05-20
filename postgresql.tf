resource "helm_release" "postgresql" {
  name       = "pg"
  namespace  = "postgres"

  chart      = "${path.module}/charts/postgresql"
  version    = "0.1.0" # или убери, если локальный чарт

  values = [
    file("${path.module}/charts/postgresql/values.yaml")
  ]
}
