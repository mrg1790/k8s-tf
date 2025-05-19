resource "yandex_vpc_subnet" "subnet-a" {
  name           = "subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.k8s.id
  v4_cidr_blocks = ["10.2.1.0/24"]
}

resource "yandex_vpc_subnet" "subnet-b" {
  name           = "subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.k8s.id
  v4_cidr_blocks = ["10.2.2.0/24"]
}

resource "yandex_vpc_subnet" "subnet-d" {
  name           = "subnet-c"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.k8s.id
  v4_cidr_blocks = ["10.2.3.0/24"]
}
