provider "yandex" {
  #token     = var.yc_token
  #cloud_id  = var.yc_cloud_id
  #folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}
provider "kubernetes" {
  config_path = "~/.kube/config"
  #config_context = "yc-k8s-cluster-jmhhsgnq"
}
provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    #config_context = "yc-k8s-cluster-jmhhsgnq"
    load_config_file = false      # чтобы не лезть в ~/.kube/config дважды
  }
}
