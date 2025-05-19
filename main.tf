terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}
provider "yandex" {
  #token     = var.yc_token
  #cloud_id  = var.yc_cloud_id
  #folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

module "k8s" {
  source = "github.com/terraform-yc-modules/terraform-yc-kubernetes"

  # Конфигурация кластера
  cluster_config = {
    name               = "plafac"
    network_id         = yandex_vpc_network.k8s.id
    service_account_id = yandex_iam_service_account.k8s.id

    # Для zonal-кластера — одна локация
    master_locations = [
      { zone = "ru-central1-a", subnet_id = yandex_vpc_subnet.subnet-a.id },
      #{ zone = "ru-central1-b", subnet_id = yandex_vpc_subnet.subnet-b.id },
      #{ zone = "ru-central1-c", subnet_id = yandex_vpc_subnet.subnet-c.id },
    ]

    # (опционально) диапазоны IP для кластера
    # cluster_ipv4_range = "10.128.0.0/16"
    # service_ipv4_range = "10.96.0.0/16"
  }

  # Группы нод
  node_groups = {
    workers = {
      auto_scale   = false
      node_count   = 1
      cores        = 1
      memory       = 2
      node_disk_size = 20
      nat          = true
      # subnet_id не нужен — будет взят из master_locations
    }
    monitoring = {
      auto_scale   = false
      node_count   = 1
      cores        = 1
      memory       = 2
      node_disk_size = 20
      nat          = true
      # subnet_id не нужен — будет взят из master_locations
    }
    postgres = {
      auto_scale   = false
      node_count   = 1
      cores        = 1
      memory       = 2
      node_disk_size = 20
      nat          = true
      # subnet_id не нужен — будет взят из master_locations
    }
  }
}

