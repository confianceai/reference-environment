# InnerData X Confiance.AI - Deployment

## Goals

The primary objective of this project is to deploy and manage a comprehensive MLOps infrastructure for the InnerData X Confiance.AI project, known as the European Trustworthy Foundation (ETF) platform. This involves setting up various middleware applications and components necessary for security, observability, and GitOps practices. The project aims to streamline the deployment process, ensure high availability, and maintain the scalability of the applications.

The scope of this project includes:

- **Infrastructure Setup**: Deploying and configuring the Kubernetes cluster and associated resources using Terraform.
- **Application Deployment**: Utilizing Helm charts to deploy and manage various applications and middleware components.
- **Documentation**: Creating and maintaining comprehensive documentation using Docusaurus to ensure all processes and configurations are well-documented and easily accessible.
- **Continuous Integration and Continuous Deployment (CI/CD)**: Implementing GitOps practices using ArgoCD to automate the deployment and management of applications.

### Technologies Used

**Terraform**
Terraform is used to define and provision the infrastructure required for the project. It allows for the creation of a consistent and reproducible infrastructure setup, ensuring that all resources are deployed and configured correctly.

**Docusaurus**
Docusaurus is utilized to create and maintain the project's documentation. It provides a modern static site generator that makes it easy to create and manage documentation, ensuring that all processes and configurations are well-documented and easily accessible.

**Helm Charts**
Helm charts are used to deploy and manage the various applications and middleware components. Helm simplifies the deployment process by packaging applications and their dependencies into a single chart, making it easy to deploy and manage applications on Kubernetes.

**GitOps with ArgoCD**
ArgoCD is used to implement GitOps practices, automating the deployment and management of applications. By using ArgoCD, we can ensure that the desired state of the applications is always maintained, and any changes are automatically applied.

### Deployed applications

The following applications are part of the ETF platform and can be deployed through its scripts. They can be used

Base Kubernetes middlewares:

|  Application  | Chart version |                      Helm repo                       |      Chart name       |   Namespace   | Host                                    |  License   |
| :-----------: | :-----------: | :--------------------------------------------------: | :-------------------: | :-----------: | --------------------------------------- | :--------: |
|    ArgoCD     |     7.7.7     |        <https://argoproj.github.io/argo-helm>        |        argo-cd        |    argocd     | <https://argocd.etf-foundation.org>     | Apache 2.0 |
| Cert-Manager  |    v1.16.2    |             <https://charts.jetstack.io>             |     cert-manager      | cert-manager  |                                         | Apache 2.0 |
|  Alloy Stack  |    1.6.13     |       <https://grafana.github.io/helm-charts>        |    k8s-monitoring     |     alloy     |                                         | Apache 2.0 |
|    Grafana    |    66.3.1     | <https://prometheus-community.github.io/helm-charts> | kube-prometheus-stack |    grafana    | <https://monitoring.etf-foundation.org> | Apache 2.0 |
|     Loki      |    6.19.0     |       <https://grafana.github.io/helm-charts>        |         loki          |     loki      |                                         | Apache 2.0 |
|     Mimir     |     5.5.1     |       <https://grafana.github.io/helm-charts>        |   mimir-distributed   |     mimir     |                                         | Apache 2.0 |
| Gitlab Runner |    0.71.0     |              <https://charts.gitlab.io>              |     gitlab-runner     | gitlab-runner |                                         |    MIT     |
| Ingress NGINX |    4.11.3     |     <https://kubernetes.github.io/ingress-nginx>     |     ingress-nginx     | ingress-nginx |                                         | Apache 2.0 |
|   Keycloak    |    24.4.6     |         <https://charts.bitnami.com/bitnami>         |       keycloak        |   keycloak    | <https://auth.etf-foundation.org>       | Apache 2.0 |
|    MetalLB    |    0.14.9     |         <https://metallb.github.io/metallb>          |        metallb        |    metallb    |                                         | Apache 2.0 |

InnerData X Confiance.AI components:

|        Application        | Chart version |               Helm repo                |   Chart name   | Namespace | Host                                                                          |      License       |
| :-----------------------: | :-----------: | :------------------------------------: | :------------: | :-------: | ----------------------------------------------------------------------------- | :----------------: |
|      Argo Workflows       |    0.45.1     | <https://argoproj.github.io/argo-helm> | argo-workflows |  shared   | <https://workflows.etf-foundation.org>                                        |     Apache 2.0     |
| Argo Workflows PostgreSQL |    16.2.1     |  <https://charts.bitnami.com/bitnami>  |   postgresql   |  shared   |                                                                               | PostgreSQL License |
|        JupyterHub         |     4.1.0     | <https://hub.jupyter.org/helm-chart/>  |   jupyterhub   |  shared   | <https://jupyterhub.etf-foundation.org>                                       |        BSD         |
|        Docusaurus         |     1.0.0     |                 Local                  |   docusaurus   |  shared   | <https://docs.etf-foundation.org>                                             |        MIT         |
|           MinIO           |     5.4.0     |        <https://charts.min.io>         |     minio      |   minio   | <https://console-minio.etf-foundation.org>, minio.etf-foundation.org (API S3) |      GNU AGPL      |

### Repo structure

The following files are directories

- `components/`: Helm charts and resources for various components.
- `docker/`: Dockerfiles for building images.
- `documentation/`: documentation files and Docusaurus configuration.
- `infra/`: infrastructure-related files.
- `CODEOWNERS`: Defines code owners for the repository.
- `LICENSE`: License file for the project.

## Installation

Please see the `documentation/` directory for the following steps.
