---
sidebar_position: 1
slug: /
---

# Introduction

## Goals

The primary objective of this project is to deploy and manage a comprehensive MLOps infrastructure for the InnerData X Confiance.AI project, known as the European Trustworthy Foundation (ETF) platform. This involves setting up various middleware applications and components necessary for security, observability, and GitOps practices. The project aims to streamline the deployment process, ensure high availability, and maintain the scalability of the applications.

The scope of this project includes:

- **Infrastructure Setup**: Deploying and configuring the Kubernetes cluster and associated resources using Terraform.
- **Application Deployment**: Utilizing Helm charts to deploy and manage various applications and middleware components.
- **Documentation**: Creating and maintaining comprehensive documentation using Docusaurus to ensure all processes and configurations are well-documented and easily accessible.
- **Continuous Integration and Continuous Deployment (CI/CD)**: Implementing GitOps practices using ArgoCD to automate the deployment and management of applications.

## Production

The configuration of the ETF platform makes this environment suitable for small teams. To make it handle production workload, meaning enable replication, high availability, separation of concerns... several changes have to be set.

- Minio replicated
- Grafana's ALGM stack replication, and topology constraints

To re-deploy the platform on your infrastructure, please follow the documentation having in mind the changes for production grade, and change the Tofu variables, and the Helm values following your needs.

:::note
Variables and values strongly tied to the official ETF platform instance are
:::

## Structure

- `components/`: Helm charts and resources for various components.
- `docker/`: Dockerfiles for building images.
- `documentation/`: Docusaurus configuration and documentation files.
- `infra/`: infrastructure-related files.
- `CODEOWNERS`: Defines code owners for the repository.
- `LICENSE`: License file for the project.

## Dependencies

- Gitlab for CI/CD and secrets management
- NVIDIA GPUs with CUDA capabilities

## Architecture

![Architecture diagram](/img/archi.png)
