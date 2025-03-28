---
sidebar_position: 2
---

# Users and RBAC

By default, users and groups are created manually on Keycloak, but it is possible to connect Keycloak to an Identity Provider or an Active Directory. Several attributes for each component may be set in order to implement and configure RBAC on them.

## Keycloak

Create a new user in the `etf` realm with the **Required user actions** option set to _Update Password_. Then, create a temporary password and communicate it to the user. The latter will then be able to connect to a component and change their password.

## Argo Workflows

To add new RBAC in Argo Workflows, you need to follow these steps:

1. **Create a new `<name>.role.yaml` file**: the `admin.role.yaml` is an example of the adminstrator role, it is located in the `components/argo-workflows-chart/assets/` folder. It is a set of a Service Account (Cluster)Role, (Cluster)RoleBinding, and a service account Secret. The ApplicationSet will automatically deploy the new file if it is in the `assets/` folder and has the `.role.yaml` suffix.

2. **Create a Keycloak group**: In Keycloak, create a group named `argo-<role>` and add the users who should have access to this group. The `<role>` should have the same name as the one in the `<name>.role.yaml`:

   ```yaml
   metadata:
     annotations:
       workflows.argoproj.io/rbac-rule: "'argo-<role>' in groups"
   ```

The [Argo Workflows documentation](https://argo-workflows.readthedocs.io/en/latest/workflow-rbac/) ans the [its security guide](https://argo-workflows.readthedocs.io/en/latest/security/) show other examples of RBAC for Argo.

:::warning
Be careful, in the UI, everyone sees all the workflows. The input parameters are in clear and can be accessed by everyone. You can use Kubernetes secrets to enable security in your workflows.
:::

## MinIO

To add new buckets, technical users (real users would log in using SSO), and policies in MinIO using the Helm chart and Keycloak groups, follow these steps:

1. **Create technical users, buckets and policies using the dedicated Helm values keys**: `users`, `policies`, `buckets`. The users credentials can be stored on Gitlab CI.

2. **Integrate with Keycloak**: in Keycloak, create a new group. On the details page of the group, go the **Attributes** tab and add the `policy` key, with the name of an existing MinIO policy as the value. Then, add desired users to this group.

## Grafana

Follow the [official documentation](https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/keycloak/) to configure Grafana with Keycloak authentication. This involves setting up Keycloak as an OAuth provider in Grafana.

To separate admin and user dashboards, you can use Grafana's folder feature:

1. **Create folders**: In Grafana, create separate folders for admin and user dashboards.

2. **Set permissions**: Assign permissions to these folders based on user roles. For example, only admin users should have edit access to the admin folder, while regular users should have view access to the root folder only.
