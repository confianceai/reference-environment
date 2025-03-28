---
sidebar_position: 2
---

# Keycloak

## Init

- [Create a new admin user](https://www.keycloak.org/docs/latest/server_admin/#proc-creating-user_server_administration_guide), and assign the realm role "admin". The temporary user created using the Helm chart must be deleted as stated in the official documentation.
- [Create a new realm](https://www.keycloak.org/docs/26.1.0/server_admin/#proc-creating-a-realm_server_administration_guide). From now on, and unless it is mentioned otherwise, everything will occur on this new realm
- [Create OIDC clients](https://www.keycloak.org/docs/26.1.0/server_admin/#_oidc_clients) for Grafana, Argo Workflows, MinIO and Docusaurus. Set Client Authentication On, and set the Root and Valid Redirect URIs addresses.
- Go to Credentials tab on each client details page. Copy the secret and fill the following Tofu variables in the `MAIN_TFVARS` Gitlab CI variable:

  ```tofu
  grafana_oauth_client_id=""
  grafana_oauth_client_secret=""
  jupyterhub_client_secret=""
  minio_client_secret=""
  workflows_sso_client_id=""
  workflows_sso_client_secret=""
  docusaurus_client_secret=""
  ```

- Follow the components-specific steps below

## Grafana

Follow the [official documentation](https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/keycloak/).

## Minio

Follow the [official documentation](https://min.io/docs/minio/macos/operations/external-iam/configure-keycloak-identity-management.html). Make sure to add the `policy` claim to the access token. The claim will contain a comma-separated list of policy names applied to the groups attributes a user is a member of.

## JupyterHub

Create the following realm scopes:

- `openid`
- `groups`

And add them as default Scopes to the previously created Jupyterhub client.

## Argo Workflows

And add the scopes `openid`, and `groups` as default Scopes to the previously created Argo Workflows client.

Add a mapper to the `groups` scope:

- type: Group Membership
- name: groups
- Token Claim Name: groups
- Full group path: off

Then, create the [argo-workflows-admin-user.service-account-token secret](https://argo-workflows.readthedocs.io/en/latest/service-account-secrets/) as the service account secrets are not created automatically anymore. You may need to restart the Pod for it to take effect.

## Docusaurus

Because Docusaurus uses OAuth2-Proxy as an authentication mechanism, it needs special configuration. The OIDC client must be configured with an audience mapper to include the client's name in the aud claim of the JWT token.
The aud claim specifies the intended recipient of the token, and OAuth2 Proxy expects a match against the values of either --client-id or --oidc-extra-audience.

In Keycloak, claims are added to JWT tokens through the use of mappers at either the realm level using "client scopes" or through "dedicated" client mappers.

- Configure a dedicated audience mapper for your client by navigating to Clients -> `<your client's id>` -> Client scopes.
- Access the dedicated mappers pane by clicking `<your client's id>-dedicated`, located under Assigned client scope. (It should have a description of "Dedicated scope and mappers for this client")
  - Click Configure a new mapper and select Audience
    - Name 'aud-mapper-`<your client's id>`'
    - Included Client Audience select `<your client's id>` from the dropdown.
    - Add to ID token 'On'
    - Add to access token 'On' - #1916
      - Save the configuration.

Any subsequent dedicated client mappers can be defined by clicking Dedicated scopes -> Add mapper -> By configuration -> Select mapper
