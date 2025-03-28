---
sidebar_position: 3
---

# Components installation

## Overview

This guide provides installation instructions for the InnerData X Confiance.AI components. The components covered include ArgoCD AppSets and Helm charts.
ArgoCD is a declarative, GitOps continuous delivery tool for Kubernetes. It automates the deployment of applications and ensures that the desired state defined in Git is reflected in the Kubernetes cluster. Helm Secrets and Vals are used to manage sensitive data and inject secrets into Helm charts during deployments. You can find more information regarding ArgoCD and Helm secrets in [our dedicated documentation](./argocd_applications).

The whole deployment will be managed through CI/CD and GitOps principles.

Deployed applications during this section:

|        Application        |              Helm repo               |   Chart name   | Namespace | Host                                         |
| :-----------------------: | :----------------------------------: | :------------: | :-------: | -------------------------------------------- |
|      Argo Workflows       | https://argoproj.github.io/argo-helm | argo-workflows |  shared   | workflows.BASE_DOMAIN                        |
| Argo Workflows PostgreSQL |  https://charts.bitnami.com/bitnami  |   postgresql   |  shared   |                                              |
|        JupyterHub         | https://hub.jupyter.org/helm-chart/  |   jupyterhub   |  shared   | jupyterhub.BASE_DOMAIN                       |
|        Docusaurus         |                Local                 |   docusaurus   |  shared   | docs.BASE_DOMAIN                             |
|           MinIO           |        https://charts.min.io         |     minio      |   minio   | console-minio.BASE_DOMAIN, minio.BASE_DOMAIN |

### Structure

The `components/` folder contains Helm charts values and ArgoCD ApplicationSets for various components used in the project. Each component has its own subfolder. The `docusaurus-chart/` folder contains our custom Helm chart for this application. All the directories contain those common files:

- `values.ref.yaml`: contains the original values from the chart regristry.
- `values.<env>.yaml`: contains the environment-specific values, and will take precedency during the deployment.
- `argo_appset.yaml`: ArgoCD Application Set declaration. It can contain multiple environment definitions.

## Installation

The only thing to do is to run the Gitlab CI stage `🦑 argo_deploy`. Then, access to ArgoCD and make sure everything has been synced.
