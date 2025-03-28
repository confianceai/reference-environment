---
sidebar_position: 4
---

# Use

## Argo Workflows

Reference: [official documentation](https://argo-workflows.readthedocs.io/en/latest/workflow-concepts/).

### Creating new templates

Create and deploy new ClusterWorkflowTemplates (CWT) in Argo Workflows:

1. **Create a new `<name>.clusterworkflowtemplate.yaml` file**: This file should define the ClusterWorkflowTemplate. For example:

   ```yaml
   apiVersion: argoproj.io/v1alpha1
   kind: ClusterWorkflowTemplate
   metadata:
     name: example-cwt
   spec:
     entrypoint: main
     templates:
       - name: main
         steps:
           - - name: step1
               template: example-task

       - name: example-task
         container:
           image: alpine:3.7
           command: [sh, -c]
           args: ["echo Hello, Argo Workflows!"]
   ```

2. **Place the file in the `components/argo-workflows-chart/assets/` folder**: Ensure the new file is located in the assets folder and has the `.cwt.yaml` suffix. The ApplicationSet will automatically deploy the new file if it meets these criteria.

## JupyterHub

### Choosing an image

When using JupyterHub, you can select from a variety of base images to suit your needs. These images come pre-installed with different sets of libraries and tools. To choose a base image:

1. Log in to JupyterHub.
2. Select the desired base image from the dropdown menu. To add other choices, see [our documentation](./operate/components#jupyterhub)
3. Click "Start" to launch your server with the selected image.

### Stopping a server

If you need to stop your JupyterHub server, if for example you do not need it anymore and other servers are not able to spawn du to resources usage, follow these steps:

1. Log in to JupyterHub.
2. Click on **File** in the top left corner.
3. Select **Hub Control Panel** from the dropdown menu.
4. Click the **Stop My Server** button.

This will terminate your current server session. You can restart it later if needed.
