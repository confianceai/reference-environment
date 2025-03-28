---
sidebar_position: 1
---

# Components

## Update Helm charts

It may be needed to update the Helm charts in order to benefit from security or feature updates of the components. Example of an update for Loki:

```shell
# Add repository locally
helm repo add grafana https://grafana.github.io/helm-charts
# Download the default values for the wanted version
helm show values grafana/loki --version A.B.C > loki-values.ref.yaml
# Then, compare them to the old ones (you can use your preferred tool instead of diff)
diff loki-values.ref.yaml infra/files/loki-values.ref.yaml
```

Then, change the `values.override.yaml` file accordingly and replace the old `ref` file by the new one.

:::warning
Upgrades can lead to data loss or applications misbehaving. Please read the official updating guides of each components before updating one.
:::

## Jupyterhub

## Adding base server options

To add base Jupyter server image options using the Helm chart, modify the `values.<env>.yaml` file of the Helm chart deployment. This file allows to configure various aspects of the Jupyterhub deployment, including the server images.

Here is an example of how to add base server options:

```yaml
singleuser:
  profileList:
    - display_name: "Datascience environment"
      description: "Default environment (Python 3.12). See: https://github.com/jupyter/docker-stacks/tree/main/images/datascience-notebook."
      kubespawner_override:
        image: quay.io/jupyter/datascience-notebook:python-3.12 # Select the image you need, it can be pulled from GitHub Container Registry, Quay or Docker Hub public registries
        image_pull_policy: IfNotPresent # Pulls the image only if its tag is not already present on the Kubernetes Node
        extra_resource_limits:
          nvidia.com/gpu: 2 # Add this to be able to use the GPUs
```

:::info
If custom images, built in a private registry, are needed, use the [`image_pull_secrets` parameter](https://jupyterhub-kubespawner.readthedocs.io/en/latest/spawner.html#kubespawner.KubeSpawner.image_pull_secrets).
:::
