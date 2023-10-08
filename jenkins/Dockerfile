FROM ghcr.io/ayudadigital/jenkins-dind:2.414.2

LABEL org.opencontainers.image.source=https://github.com/ayudadigital/gp-jenkins
LABEL org.opencontainers.image.description="Generic Platform - Jenkins Service"
LABEL org.opencontainers.image.licenses=MIT

# Upgrade system and instlal extra packages
RUN apk upgrade --no-cache && \
    apk add --no-cache rsync jq libxml2-utils docker-compose sed make gawk vim gettext && \
    apk add --no-cache git-secret --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

# Jenkins plugin installation
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN cd /tmp && \
    wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.13/jenkins-plugin-manager-2.12.13.jar && \
    java -jar jenkins-plugin-manager-2.12.13.jar --plugin-file /var/jenkins_home/plugins.txt --verbose

# Copy backup/cleanup and healthcheck scripts
COPY backup /usr/local/bin/backup
COPY cleanup /usr/local/bin/cleanup
COPY healthcheck /usr/local/bin/healthcheck

# Entrypoint
COPY start.sh /
ENTRYPOINT ["/start.sh"]

# GP service identification
RUN echo "jenkins" > /gp.service
