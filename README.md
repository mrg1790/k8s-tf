# k8s-tf
```
yc managed-kubernetes cluster get-credentials test-k8s-cluster --external
```

```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
```
