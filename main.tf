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

  # 1) Сеть
  network_id = yandex_vpc_network.k8s.id

  # 2) Локации мастеров (одна — zonal, три — regional)
  master_locations = [
    { zone      = "ru-central1-a", subnet_id = yandex_vpc_subnet.subnet-a.id },
    #{ zone      = "ru-central1-b", subnet_id = yandex_vpc_subnet.subnet-b.id },
    #{ zone      = "ru-central1-d", subnet_id = yandex_vpc_subnet.subnet-c.id },
  ]

  # 3) Группы нод: любое имя ключа — это имя пул-группы
  node_groups = {
    workers = {
      fixed_scale    = { size = 3 }
      cores          = 2
      memory         = 4
      node_disk_size = 50
      nat            = true
    }
    monitoring = {
      fixed_scale    = { size = 1 }
      cores          = 1
      memory         = 2
      node_disk_size = 20
      nat            = false
    }
    postgres = {
      fixed_scale    = { size = 1 }
      cores          = 1
      memory         = 2
      node_disk_size = 20
      nat            = false
    }
  }
}
