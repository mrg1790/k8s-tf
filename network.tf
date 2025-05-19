resource "yandex_vpc_network" "k8s" {
  name = "k8s-network"
}

resource "yandex_vpc_subnet" "k8s-subnet" {
  name           = "k8s-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.k8s.id
  v4_cidr_blocks = ["10.2.0.0/16"]
}
