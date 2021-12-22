# Chartmuseum stack

Setup Chartmuseum service on Cloud Run with Terraform.

## Notes

This stack is perfectible (eg. : add CI/CD) and is only given to you as a PoC to build your perfect Cloud Run service with Terraform.

## Prerequisites

* IAM permissions for the service account using to run `terraform`
* A Google Secret to store authentication infos for your Chartmuseum service

Example of a secret :

```json
{"chartmuseum_user": "MYUSER", "chartmuseum_password":"MYPASSWORD"}
```

This secret will be then injected in your Cloud Run service through environment variables.

## Updating Charmtuseum image

With Cloud Run, Docker images need to be hosted on Google Container Registry or Google Artifact Registry. So we need to tag an image from the bitnami one and push it to Google.

```bash
docker pull bitnami/chartmuseum:0.13.1
docker tag bitnami/chartmuseum:0.13.1 europe-west1-docker.pkg.dev/YOURPROJECT/docker-public/chartmuseum:0.13.1
docker push europe-west1-docker.pkg.dev/YOURPROJECT/docker-public/chartmuseum:0.13.1
```
