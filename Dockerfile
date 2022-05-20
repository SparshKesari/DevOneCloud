FROM alpine:latest

ENV AWSCLI_VERSION=1.19.73
ENV TERRAFORM_VERSION=0.15.3
ENV SOPS_VERSION=3.7.1

RUN apk --no-cache update && \
    apk --no-cache add \
        python3-dev \
        py3-pip \
        libffi-dev \
        openssl-dev \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        jq \
        gettext-dev \
        curl \
        nodejs \
        npm \
        g++ \
        zip \
	curl \
        git

RUN pip3 --no-cache-dir install --upgrade setuptools==54.2.0 awscli==${AWSCLI_VERSION} && \
    update-ca-certificates && \
    curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN rm -rf /var/cache/apk/*

COPY prepare.sh /prepare.sh

RUN chmod +x /prepare.sh

ENTRYPOINT ["./prepare.sh"]
