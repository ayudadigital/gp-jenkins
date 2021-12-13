FROM ayudadigital/jenkins-dind:2.319.1

# Packages
RUN apk add --no-cache rsync jq libxml2-utils docker-compose sed make gawk vim gettext && \
    apk add --no-cache git-secret --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

# Add git-secret
RUN cd /tmp && \
    git clone https://github.com/sobolevn/git-secret.git git-secret && \
    cd git-secret && \
    make build && \
    PREFIX="/usr/local" make install

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