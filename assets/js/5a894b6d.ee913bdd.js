"use strict";(self.webpackChunkdocumentation=self.webpackChunkdocumentation||[]).push([[4008],{4442:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>o,contentTitle:()=>l,default:()=>h,frontMatter:()=>a,metadata:()=>r,toc:()=>c});const r=JSON.parse('{"id":"deploy/install_infra","title":"Infrastructure installation","description":"Overview","source":"@site/docs/deploy/install_infra.md","sourceDirName":"deploy","slug":"/deploy/install_infra","permalink":"/reference-environment/deploy/install_infra","draft":false,"unlisted":false,"tags":[],"version":"current","sidebarPosition":1,"frontMatter":{"sidebar_position":1},"sidebar":"tutorialSidebar","previous":{"title":"Introduction","permalink":"/reference-environment/"},"next":{"title":"Keycloak","permalink":"/reference-environment/deploy/keycloak"}}');var s=t(4848),i=t(8453);const a={sidebar_position:1},l="Infrastructure installation",o={},c=[{value:"Overview",id:"overview",level:2},{value:"Structure",id:"structure",level:3},{value:"Infrastructure prerequisites",id:"infrastructure-prerequisites",level:2},{value:"Installation",id:"installation",level:2},{value:"Prerequisites",id:"prerequisites",level:3},{value:"Deployment",id:"deployment",level:3},{value:"Let&#39;s Encrypt production test",id:"lets-encrypt-production-test",level:3},{value:"Keycloak configuration",id:"keycloak-configuration",level:3},{value:"ArgoCD configuration",id:"argocd-configuration",level:3},{value:"Grafana configuration",id:"grafana-configuration",level:3},{value:"Follow-up",id:"follow-up",level:2}];function d(e){const n={a:"a",admonition:"admonition",code:"code",em:"em",h1:"h1",h2:"h2",h3:"h3",header:"header",li:"li",mermaid:"mermaid",p:"p",pre:"pre",strong:"strong",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",ul:"ul",...(0,i.R)(),...e.components};return(0,s.jsxs)(s.Fragment,{children:[(0,s.jsx)(n.header,{children:(0,s.jsx)(n.h1,{id:"infrastructure-installation",children:"Infrastructure installation"})}),"\n",(0,s.jsx)(n.h2,{id:"overview",children:"Overview"}),"\n",(0,s.jsxs)(n.p,{children:["This guide provides installation instructions, usage guidelines, and troubleshooting tips for the main Kubernetes infrastructure used in the InnerData X Confiance.AI project. The components covered include OpenTofu scripts and Helm Charts.\nWhat is called ",(0,s.jsx)(n.em,{children:"Kubernetes Infrastructure"})," in this project is the set of middleware applications needed to manage InnerData and Confiance components. Main Helm charts required to enable security, observability, and GitOps practices. Clone the present repository locally."]}),"\n",(0,s.jsx)(n.admonition,{type:"info",children:(0,s.jsxs)(n.p,{children:["OpenTofu is used in this project as ",(0,s.jsx)(n.a,{href:"https://www.hashicorp.com/license-faq",children:"Terraform is no longer a FOSS tool"}),". The scripts may be compatible with Terraform but we do not guarantee it."]})}),"\n",(0,s.jsx)(n.p,{children:"Deployed applications during this section:"}),"\n",(0,s.jsxs)(n.table,{children:[(0,s.jsx)(n.thead,{children:(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.th,{style:{textAlign:"center"},children:"Application"}),(0,s.jsx)(n.th,{style:{textAlign:"center"},children:"Helm repo"}),(0,s.jsx)(n.th,{style:{textAlign:"center"},children:"Chart name"}),(0,s.jsx)(n.th,{style:{textAlign:"center"},children:"Namespace"}),(0,s.jsx)(n.th,{children:"Host"})]})}),(0,s.jsxs)(n.tbody,{children:[(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"ArgoCD"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://argoproj.github.io/argo-helm",children:"https://argoproj.github.io/argo-helm"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"argo-cd"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"argocd"}),(0,s.jsx)(n.td,{children:(0,s.jsx)(n.code,{children:"argocd.<BASE_DOMAIN>"})})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"Cert-Manager"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://charts.jetstack.io",children:"https://charts.jetstack.io"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"cert-manager"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"cert-manager"}),(0,s.jsx)(n.td,{})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"Alloy Stack"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://grafana.github.io/helm-charts",children:"https://grafana.github.io/helm-charts"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"k8s-monitoring"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"alloy"}),(0,s.jsx)(n.td,{})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"Grafana"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://prometheus-community.github.io/helm-charts",children:"https://prometheus-community.github.io/helm-charts"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"kube-prometheus-stack"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"grafana"}),(0,s.jsx)(n.td,{children:(0,s.jsx)(n.code,{children:"monitoring.<BASE_DOMAIN>"})})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"Loki"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://grafana.github.io/helm-charts",children:"https://grafana.github.io/helm-charts"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"loki"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"loki"}),(0,s.jsx)(n.td,{})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"Mimir"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://grafana.github.io/helm-charts",children:"https://grafana.github.io/helm-charts"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"mimir-distributed"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"mimir"}),(0,s.jsx)(n.td,{})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"Gitlab Runner"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://charts.gitlab.io",children:"https://charts.gitlab.io"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"gitlab-runner"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"gitlab-runner"}),(0,s.jsx)(n.td,{})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"Ingress NGINX"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://kubernetes.github.io/ingress-nginx",children:"https://kubernetes.github.io/ingress-nginx"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"ingress-nginx"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"ingress-nginx"}),(0,s.jsx)(n.td,{})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"Keycloak"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://charts.bitnami.com/bitnami",children:"https://charts.bitnami.com/bitnami"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"keycloak"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"keycloak"}),(0,s.jsx)(n.td,{children:(0,s.jsx)(n.code,{children:"auth.<BASE_DOMAIN>"})})]}),(0,s.jsxs)(n.tr,{children:[(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"MetalLB"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:(0,s.jsx)(n.a,{href:"https://metallb.github.io/metallb",children:"https://metallb.github.io/metallb"})}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"metallb"}),(0,s.jsx)(n.td,{style:{textAlign:"center"},children:"metallb"}),(0,s.jsx)(n.td,{})]})]})]}),"\n",(0,s.jsx)(n.h3,{id:"structure",children:"Structure"}),"\n",(0,s.jsxs)(n.p,{children:["The ",(0,s.jsx)(n.code,{children:"infra/"})," directory contains the infrastructure-related files and configurations required to deploy and manage the Kubernetes infrastructure for the InnerData X Confiance.AI project. This includes OpenTofu scripts, Helm values, Terraform configurations, and other necessary resources to set up and maintain the infrastructure."]}),"\n",(0,s.jsx)(n.pre,{children:(0,s.jsx)(n.code,{className:"language-shell",children:"infra/\n\u251c\u2500\u2500 helm-values/\n\u2502   \u251c\u2500\u2500 argocd.ref.yaml\n\u2502   \u251c\u2500\u2500 argocd.override.yaml\n\u2502   \u251c\u2500\u2500 loki.ref.yaml\n\u2502   \u251c\u2500\u2500 loki.override.yaml\n\u2502   \u2514\u2500\u2500 ...\n\u251c\u2500\u2500 modules/\n\u2502   \u2514\u2500\u2500 helm/\n\u2502       \u251c\u2500\u2500 main.tf\n\u2502       \u2514\u2500\u2500 variables.tf\n\u251c\u2500\u2500 .terraform.lock.hcl\n\u251c\u2500\u2500 main.tf\n\u251c\u2500\u2500 providers.tf\n\u251c\u2500\u2500 secrets.tf\n\u2514\u2500\u2500 variables.tf\n"})}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsxs)(n.li,{children:["\n",(0,s.jsxs)(n.p,{children:[(0,s.jsx)(n.strong,{children:"helm-values/"}),": Contains Helm values files for various components such as ArgoCD, Loki, MetalLB, Mimir, and NGINX. These files define the configuration and values used during the Helm chart deployments. There is always a pair of values files: the ",(0,s.jsx)(n.code,{children:".ref.yaml"})," containing the original values from the chart regristry, and the ",(0,s.jsx)(n.code,{children:".override.yaml"})," which are modified following our needs, and which will take precedency during the deployment."]}),"\n"]}),"\n",(0,s.jsxs)(n.li,{children:["\n",(0,s.jsxs)(n.p,{children:[(0,s.jsx)(n.strong,{children:"modules/"}),": Contains reusable Tofu modules for deploying Helm charts and managing component secrets."]}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsxs)(n.li,{children:[(0,s.jsx)(n.code,{children:"helm/"}),": Module for deploying Helm charts using Tofu."]}),"\n"]}),"\n"]}),"\n",(0,s.jsxs)(n.li,{children:["\n",(0,s.jsxs)(n.p,{children:[(0,s.jsx)(n.strong,{children:"main.tf"}),": Main Tofu configuration file that defines the infrastructure resources and their dependencies."]}),"\n"]}),"\n",(0,s.jsxs)(n.li,{children:["\n",(0,s.jsxs)(n.p,{children:[(0,s.jsx)(n.strong,{children:"providers.tf"}),": Defines the required Tofu providers and their versions."]}),"\n"]}),"\n",(0,s.jsxs)(n.li,{children:["\n",(0,s.jsxs)(n.p,{children:[(0,s.jsx)(n.strong,{children:"secrets.tf"}),": Contains Tofu configurations for managing Kubernetes secrets and Gitlab CI variables for both middlewares and components."]}),"\n"]}),"\n",(0,s.jsxs)(n.li,{children:["\n",(0,s.jsxs)(n.p,{children:[(0,s.jsx)(n.strong,{children:"variables.tf"}),": Defines the input variables used in the Tofu configurations."]}),"\n"]}),"\n"]}),"\n",(0,s.jsx)(n.p,{children:"This structure ensures that the infrastructure setup is modular, reusable, and easy to manage, providing a clear separation of concerns and facilitating the deployment and maintenance of the Kubernetes infrastructure."}),"\n",(0,s.jsx)(n.h2,{id:"infrastructure-prerequisites",children:"Infrastructure prerequisites"}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsx)(n.li,{children:"Have admin access to a Kubernetes cluster"}),"\n",(0,s.jsx)(n.li,{children:"Have access to an S3-compatible storage system"}),"\n",(0,s.jsx)(n.li,{children:"Created a domain name and be able to change the A entry to point towards NGINX Ingress Controller Load Balancer service IP address"}),"\n",(0,s.jsx)(n.li,{children:"If the environment is only accessible through a VPN, make sure you have a compatible endpoint with Cert-Manager Let's Encrypt DNS01 challenge mechanism"}),"\n"]}),"\n",(0,s.jsx)(n.h2,{id:"installation",children:"Installation"}),"\n",(0,s.jsx)(n.h3,{id:"prerequisites",children:"Prerequisites"}),"\n",(0,s.jsxs)(n.p,{children:["Install tofu (version >= 1.9) locally or use the tofu Docker image. The latter will be used throughout the installation steps. The state can be stored everywhere (but locally), the preferred places being in an S3-compatible storage, or using ",(0,s.jsx)(n.a,{href:"https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html",children:"Gitlab state backend"}),". See ",(0,s.jsx)(n.a,{href:"https://opentofu.org/docs/language/settings/backends/http/#configuration-variables",children:"OpenTofu documentation"})," for backend configuration."]}),"\n",(0,s.jsx)(n.p,{children:"Ensure you have access to the Kubernetes cluster and set it as your current context."}),"\n",(0,s.jsxs)(n.p,{children:["The ",(0,s.jsx)(n.code,{children:"infra/"}),' directory contains the instructions to deploy a set of Helm charts resources with OpenTofu. Create a Gitlab CI variable of type "File" called ',(0,s.jsx)(n.code,{children:"MAIN_TFVARS"}),", and fill following variables:"]}),"\n",(0,s.jsx)(n.pre,{children:(0,s.jsx)(n.code,{className:"language-hcl",children:'# Local Kubernetes context name pointing to desired Kubernetes cluster\nkube_context = ""\n# Gitlab Runner registration token (See https://docs.gitlab.com/runner/register/#register-with-a-runner-registration-token-deprecated)\ngitlab_reg_token = ""\n# Gitlab repository\'s access token, used to add CI variables\ngitlab_project_token = ""\n# Gitlab Project ID\ngitlab_project_id = 7934\n# Grafana admin password\ngrafana_admin_password = ""\n# Corporate email address for Let\'s Encrypt certificate request\nle_email_address = ""\n# Gitlab URL\ngitlab_url = ""\n# Gitlab ArgoCD user\ngitlab_argocd_user = ""\n# Gitlab ArgoCD token\ngitlab_argocd_token = ""\n# Corporate email address for Let\'s Encrypt certificate request\nle_email_address = ""\n# Ingress class name\ningress_class_name = ""\n# Keycloak cluster issuer\nkc_cluster_issuer = ""\n# Docker Hub server. Leave it empty or set it to your private registry.\ncontainer_registry_server = ""\n# Docker Hub username\ncontainer_registry_username = ""\n# Docker Hub password\ncontainer_registry_password = ""\n# Internal container registry server\ninternal_container_registry_server = ""\n# Internal container registry username\ninternal_container_registry_username = ""\n# Internal container registry password\ninternal_container_registry_password = ""\n# Grafana OAuth client ID created in Keycloak\ngrafana_oauth_client_id = ""\n# Grafana OAuth client secret created in Keycloak\ngrafana_oauth_client_secret = ""\n# Base domain name. Example: etf-foundation.com\nbase_domain = ""\n# Keycloak Realm name\nrealm_name = ""\n# Helm secrets image tag\nhelm_secrets_image_tag = ""\n# Cert challenge DNS01 application key\ncert_challenge_dns01_application_key = ""\n# Cert challenge DNS01 secret name\ncert_challenge_dns01_secret_name = ""\n# Cert challenge DNS01 consumer key\ncert_challenge_dns01_consumer_key = ""\n# Cert challenge DNS01 endpoint\ncert_challenge_dns01_endpoint = ""\n# Cert challenge DNS01 group name\ncert_challenge_dns01_group_name = ""\n# Cert challenge DNS01 solver name\ncert_challenge_dns01_solver_name = ""\n# External S3 region\ns3_region = ""\n# External S3 access key ID\ns3_access_key_id = ""\n# External S3 secret access key\ns3_secret_access_key = ""\n# External S3 endpoint\ns3_endpoint = ""\n# JupyterHub client secret created later in Keycloak. Can be set to null at the beginning.\njupyterhub_client_secret = null\n# MinIO client secret created later in Keycloak. Can be set to null at the beginning.\nminio_client_secret = null\n# Argo Workflows client ID created later in Keycloak. Can be set to null at the beginning.\nworkflows_sso_client_id = null\n# Argo Workflows client secret created later in Keycloak. Can be set to null at the beginning.\nworkflows_sso_client_secret = null\n# Docusaurus client secret created later in Keycloak. Can be set to null at the beginning.\ndocusaurus_client_secret = null\n'})}),"\n",(0,s.jsx)(n.p,{children:"Then, create the following Gitlab CI Variables:"}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsxs)(n.li,{children:["To use Tofu in Gitlab CI, create a new Access Token on the project having ",(0,s.jsx)(n.code,{children:"api"})," scope and at least ",(0,s.jsx)(n.code,{children:"Developer"})," role. Then create a CI Variable called ",(0,s.jsx)(n.code,{children:"TF_HTTP_PASSWORD"})," and having the token's value."]}),"\n",(0,s.jsxs)(n.li,{children:["For ArgoCD, follow ",(0,s.jsx)(n.a,{href:"https://github.com/helmfile/vals?tab=readme-ov-file#gitlab-secrets",children:"vals documentation"})]}),"\n"]}),"\n",(0,s.jsx)(n.h3,{id:"deployment",children:"Deployment"}),"\n",(0,s.jsx)(n.mermaid,{value:'flowchart LR\n    first_apps["`MetalLB\n    Gitlab Runner\n    Cert Manager\n    Loki + Mimir + Alloy\n    NGINX IC\n    Keycloak`"]\n    certs_test(["`Let\'s Encrypt prod testing`"])\n    kc_config(["`Manual configuration\n    of Keycloak`"])\n    sso_apps["`Grafana\n    ArgoCD\n    `"]\n    argo_apps["`InnerData\n    X\n    Confiance.AI\n    components\n    `"]\n    subgraph Tofu\n        first_apps --\x3e certs_test\n        certs_test --\x3e kc_config\n        kc_config --\x3e sso_apps\n    end\n    subgraph GitOps\n        sso_apps --\x3e argo_apps\n    end'}),"\n",(0,s.jsxs)(n.p,{children:["Before installing MetalLB, see ",(0,s.jsx)(n.a,{href:"https://metallb.universe.tf/installation/",children:"official documentation"})," for specific settings depending on your infrastructure implementation. Create the ",(0,s.jsx)(n.a,{href:"https://metallb.universe.tf/configuration/",children:"IPAddressPool"})," that will allow Kubernetes Services to use the declared addresses as external IP addresses:"]}),"\n",(0,s.jsx)(n.pre,{children:(0,s.jsx)(n.code,{className:"language-yaml",children:"apiVersion: metallb.io/v1beta1\nkind: IPAddressPool\nmetadata:\n  name: ip-pool\n  namespace: metallb-system\nspec:\n  addresses:\n    - 192.168.254.50/29\n```\n\n```shell\ncd infra/\nexport TOFU_VERSION=1.9\nsudo docker run ghcr.io/opentofu/opentofu:${TOFU_VERSION} init\nsudo docker run ghcr.io/opentofu/opentofu:${TOFU_VERSION} fmt\nsudo docker run ghcr.io/opentofu/opentofu:${TOFU_VERSION} validate\n# Step 01: Install base infrastructure. We exclude the cluster issuers as the CRD are not currently installed and it will make tofu fail\nsudo docker run ghcr.io/opentofu/opentofu:${TOFU_VERSION} plan -out main.tfplan -lock=false -exclude module.grafana -exclude module.argocd -exclude kubernetes_manifest.cluster_issuer_le_staging -exclude kubernetes_manifest.cluster_issuer_le_prod -var-file=main.tfvars\nsudo docker run ghcr.io/opentofu/opentofu:${TOFU_VERSION} apply tfplan\n# Step 02: Install cert-manager ClusterIssuers CRDs and OVH DNS01-challenge files (if needed, otherwise the HTTP01 would be recommended)\nsudo docker run ghcr.io/opentofu/opentofu:${TOFU_VERSION} plan -out main.tfplan -lock=false -exclude module.grafana -exclude module.argocd -var-file=main.tfvars\n# Step 02 - B: Follow the README on https://github.com/baarde/cert-manager-webhook-ovh for DNS01 challenge over a VPN\n"})}),"\n",(0,s.jsx)(n.h3,{id:"lets-encrypt-production-test",children:"Let's Encrypt production test"}),"\n",(0,s.jsxs)(n.p,{children:["You can test your Let's Encrypt configuration after running the step 2. Follow the ",(0,s.jsx)(n.a,{href:"https://cert-manager.io/docs/tutorials/acme/http-validation/#issuing-an-acme-certificate-using-http-validation",children:"Cert Manager documentation"})," to understand why you should do so. You only have to change the value of the Tofu variable ",(0,s.jsx)(n.code,{children:"kc_cluster_issuer"})," to ",(0,s.jsx)(n.code,{children:"letsencrypt-staging"}),", deploy the platform and then check if the certificates are issued. If so, you can revert your changes to ",(0,s.jsx)(n.code,{children:"kc_cluster_issuer"})," and deploy the platform again."]}),"\n",(0,s.jsx)(n.h3,{id:"keycloak-configuration",children:"Keycloak configuration"}),"\n",(0,s.jsx)(n.p,{children:"You now have to configure Keycloak and create the needded clients. Refer to the following guides for configuring Keycloak with ArgoCD and Grafana:"}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsx)(n.li,{children:(0,s.jsx)(n.a,{href:"https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/keycloak/",children:"ArgoCD Keycloak integration"})}),"\n",(0,s.jsx)(n.li,{children:(0,s.jsx)(n.a,{href:"https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/keycloak/",children:"Grafana Keycloak integration"})}),"\n"]}),"\n",(0,s.jsxs)(n.p,{children:["Then, refer to our ",(0,s.jsx)(n.a,{href:"./keycloak",children:"dedicated documentation"}),"."]}),"\n",(0,s.jsxs)(n.p,{children:["Once Keycloak has been configured, you can deploy the rest of the applications using Gitlab CI. Run the jobs in the ",(0,s.jsx)(n.code,{children:"\ud83d\udc0b images_build"})," and ",(0,s.jsx)(n.code,{children:"\ud83d\udfe8 tofu"})," stages. Please see the ",(0,s.jsx)(n.code,{children:".gitlab-ci.yml"})," file for a description of the jobs."]}),"\n",(0,s.jsx)(n.h3,{id:"argocd-configuration",children:"ArgoCD configuration"}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsxs)(n.li,{children:["In ArgoCD, create a new project called ",(0,s.jsx)(n.code,{children:"prod"}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsxs)(n.li,{children:["Add a destination: ",(0,s.jsx)(n.code,{children:"https://kubernetes.default.svc"}),", ",(0,s.jsx)(n.code,{children:"in-cluster"}),", ",(0,s.jsx)(n.code,{children:"*"})," namespaces"]}),"\n",(0,s.jsxs)(n.li,{children:["Add source repository: ",(0,s.jsx)(n.code,{children:"*"})]}),"\n"]}),"\n"]}),"\n",(0,s.jsx)(n.li,{children:"In your Git instance, create an access token for ArgoCD and copy it"}),"\n",(0,s.jsxs)(n.li,{children:["In ArgoCD, in Settings > Repositories > Connect Repo, add this repository:","\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsx)(n.li,{children:"Connection method: via HTTPS"}),"\n",(0,s.jsx)(n.li,{children:"Type: git"}),"\n",(0,s.jsxs)(n.li,{children:["Project: ",(0,s.jsx)(n.code,{children:"prod"})]}),"\n",(0,s.jsxs)(n.li,{children:["Repository URL: ",(0,s.jsx)(n.code,{children:"https://your-instance.com/repo.git"})]}),"\n",(0,s.jsxs)(n.li,{children:["Username: ",(0,s.jsx)(n.code,{children:"argocd"})]}),"\n",(0,s.jsx)(n.li,{children:"Password: paste the token you generated"}),"\n"]}),"\n"]}),"\n"]}),"\n",(0,s.jsx)(n.h3,{id:"grafana-configuration",children:"Grafana configuration"}),"\n",(0,s.jsxs)(n.p,{children:["Add Loki as the logs source by going to ",(0,s.jsx)(n.strong,{children:"Connections > Add new connection > Loki"})," and then click on ",(0,s.jsx)(n.em,{children:"Add new datasource"}),". Then, set ",(0,s.jsx)(n.code,{children:"http://loki-gateway.loki.svc.cluster.local"})," as the URL and click on ",(0,s.jsx)(n.em,{children:"Save and Test"}),". You can now explore the logs on ",(0,s.jsx)(n.strong,{children:"Explore > Logs"})," or you can also import a ",(0,s.jsx)(n.a,{href:"https://grafana.com/grafana/dashboards/13186-loki-dashboard/",children:"dedicated Grafana Hub dashboard"})," on ",(0,s.jsx)(n.strong,{children:"Dashboards > New > Import"}),":"]}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsxs)(n.li,{children:["Paste this number: ",(0,s.jsx)(n.code,{children:"13186"})]}),"\n",(0,s.jsxs)(n.li,{children:["Then, edit the dashboard by changing the variables:","\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsxs)(n.li,{children:[(0,s.jsx)(n.code,{children:"metric"}),": set to ",(0,s.jsx)(n.code,{children:"kube_pod_container_info, namespace=$namespace"})]}),"\n",(0,s.jsxs)(n.li,{children:[(0,s.jsx)(n.code,{children:"workload"}),": delete this variable"]}),"\n"]}),"\n"]}),"\n"]}),"\n",(0,s.jsx)(n.admonition,{type:"tip",children:(0,s.jsx)(n.p,{children:"For RBAC considerations, it is possible to create new folder Admin, restrict access Admin users only and move all the dashboards in there. Then, create or copy unrestricted dashboards in the root folder."})}),"\n",(0,s.jsx)(n.p,{children:"To monitor GPU metrics, consider importing those two dashboards:"}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsx)(n.li,{children:(0,s.jsx)(n.a,{href:"https://grafana.com/grafana/dashboards/10646-kubernetes-deployment-metrics-with-gpu/",children:"Kubernetes Deployment Metrics with GPU"})}),"\n",(0,s.jsx)(n.li,{children:(0,s.jsx)(n.a,{href:"https://grafana.com/grafana/dashboards/12239-nvidia-dcgm-exporter-dashboard/",children:"NVIDIA DCGM Exporter Dashboard"})}),"\n"]}),"\n",(0,s.jsx)(n.h2,{id:"follow-up",children:"Follow-up"}),"\n",(0,s.jsxs)(n.p,{children:["The components are now ready to be installed. Please follow the ",(0,s.jsx)(n.a,{href:"./install_components",children:"dedicated documentation"}),"."]})]})}function h(e={}){const{wrapper:n}={...(0,i.R)(),...e.components};return n?(0,s.jsx)(n,{...e,children:(0,s.jsx)(d,{...e})}):d(e)}}}]);