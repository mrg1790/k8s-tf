resource "yandex_iam_service_account" "k8s" {
  name        = "k8s-sa"
  description = "Service account for K8s cluster"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-editor" {
  folder_id = var.yc_folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.k8s.id}"
}
