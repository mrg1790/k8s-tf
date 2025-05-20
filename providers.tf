provider "kubernetes" {
  config_path = "~/.kube/config"
  # опционально, если у вас несколько контекстов:
  # config_context = "your-context-name"
}
