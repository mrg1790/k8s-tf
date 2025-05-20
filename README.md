# k8s-tf

```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
```
```
export TF_VAR_yc_token="$YC_TOKEN"
export TF_VAR_yc_cloud_id="$YC_CLOUD_ID"
export TF_VAR_yc_folder_id="$YC_FOLDER_ID"
```

```
yc managed-kubernetes cluster get-credentials test-k8s-cluster --external
```
