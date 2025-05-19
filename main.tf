provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

module "k8s" {
  source  = "github.com/terraform-yc-modules/terraform-yc-kubernetes"

  cluster_name        = "my-cluster"
  network_id          = yandex_vpc_network.k8s.id
  cluster_zones       = ["ru-central1-a"]
  service_account_id  = yandex_iam_service_account.k8s.id

  node_groups = {
    "default" = {
      node_zone        = "ru-central1-a"
      node_count       = 2
      auto_scale       = true
      auto_scale_min   = 2
      auto_scale_max   = 5
      node_labels      = { "role" = "worker" }
      preemptible      = false
      nat              = true
      node_disk_size   = 50
    }
  }
}
