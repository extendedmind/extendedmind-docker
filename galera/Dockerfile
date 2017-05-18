# https://hub.docker.com/r/adfinissygroup/k8s-mariadb-galera-centos/
FROM centos:centos7
MAINTAINER adfinis-sygroup.ch <info@adfinis-sygroup.ch>
LABEL io.k8s.description="MariaDB is a multi-user, multi-threaded SQL database server" \
      io.k8s.display-name="MariaDB 10.1" \
      io.openshift.expose-services="3306:mysql" \
      io.openshift.tags="database,mysql,mariadb10,rh-mariadb10"
EXPOSE 3306/tcp

COPY root/etc/yum.repos.d/mariadb.repo /etc/yum.repos.d/

# These read from: http://yum.mariadb.org/10.1/centos7-amd64/rpms/
ENV MARIADB_VERSION 10.1.23
ENV GALERA_VERSION 125.3.20

RUN rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB && \
    yum install -y \
      epel-release && \
    yum install -y \
      MariaDB-client-$MARIADB_VERSION \
      MariaDB-server-$MARIADB_VERSION \
      galera-$GALERA_VERSION \
      which \
      socat \
      percona-xtrabackup \
      bind-utils \
      policycoreutils && \
    yum clean all
RUN echo '!include /etc/config/my_extra.cnf' >> /etc/my.cnf

COPY root /
RUN /usr/libexec/container-setup.sh

VOLUME ["/var/lib/mysql"]
USER 27
ENTRYPOINT ["/usr/bin/container-entrypoint.sh"]
