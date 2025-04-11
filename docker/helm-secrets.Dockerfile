# Reference: https://github.com/jkroepke/helm-secrets/wiki/ArgoCD-Integration#option-1-custom-docker-image
ARG ARGOCD_VERSION="v2.13.3"
FROM quay.io/argoproj/argocd:$ARGOCD_VERSION
ARG KUBECTL_VERSION=1.30.2
ARG VALS_VERSION=0.37.3
ARG HELM_SECRETS_VERSION=4.6.0

# vals
ENV HELM_SECRETS_BACKEND="vals" \
    HELM_SECRETS_HELM_PATH=/usr/local/bin/helm \
    HELM_PLUGINS="/home/argocd/.local/share/helm/plugins/" \
    HELM_SECRETS_VALUES_ALLOW_SYMLINKS=false \
    HELM_SECRETS_VALUES_ALLOW_ABSOLUTE_PATH=false \
    HELM_SECRETS_VALUES_ALLOW_PATH_TRAVERSAL=false \
    HELM_SECRETS_WRAPPER_ENABLED=false \
    HELM_PLUGINS=/gitops-tools/helm-plugins/ \
    HELM_SECRETS_CURL_PATH=/gitops-tools/curl \
    HELM_SECRETS_VALS_PATH=/gitops-tools/vals \
    HELM_SECRETS_KUBECTL_PATH=/gitops-tools/kubectl \
    PATH="$PATH:/gitops-tools"

USER root
RUN apt-get update && \
    apt-get install -y \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /gitops-tools/helm-plugins

RUN \ 
    GO_ARCH=$(uname -m | sed -e 's/x86_64/amd64/') && \
    wget -qO "/gitops-tools/curl" "https://github.com/moparisthebest/static-curl/releases/latest/download/curl-${GO_ARCH}" && \
    true

RUN \
    GO_ARCH=$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/') && \
    wget -qO "/gitops-tools/kubectl" "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${GO_ARCH}/kubectl" && \
    true

# vals backend installation
RUN \
    GO_ARCH=$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/') && \
    wget -qO- "https://github.com/helmfile/vals/releases/download/v${VALS_VERSION}/vals_${VALS_VERSION}_linux_${GO_ARCH}.tar.gz" | tar zxv -C /gitops-tools vals && \
    true

# helm secert installation 
RUN \
    wget -qO- "https://github.com/jkroepke/helm-secrets/releases/download/v${HELM_SECRETS_VERSION}/helm-secrets.tar.gz" | tar -C /gitops-tools/helm-plugins -xzf- && \
    true

RUN chmod +x /gitops-tools/* && ln -sf /gitops-tools/helm-plugins/helm-secrets/scripts/wrapper/helm.sh /usr/local/sbin/helm

USER argocd
