FROM ayudadigital/jenkins-dind:2.332.3

# Upgrade system and instlal extra packages
RUN apk upgrade --no-cache && \
    apk add --no-cache rsync jq libxml2-utils docker-compose sed make gawk vim gettext && \
    apk add --no-cache git-secret --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

# Jenkins plugin installation
USER jenkins
COPY --chown=jenkins:jenkins plugins.txt /var/jenkins_home/plugins.txt
RUN install-plugins.sh < /var/jenkins_home/plugins.txt
USER root

# Copy backup/cleanup and healthcheck scripts
COPY backup /usr/local/bin/backup
COPY cleanup /usr/local/bin/cleanup
COPY healthcheck /usr/local/bin/healthcheck

# Entrypoint
COPY start.sh /
ENTRYPOINT ["/start.sh"]

# GP service identification
RUN echo "jenkins" > /gp.service
