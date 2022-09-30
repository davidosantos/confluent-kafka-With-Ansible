# Shortcut for pre-installing packages to save time.
# Pull from cnfltraining/ansible.
FROM geerlingguy/docker-centos7-ansible

RUN yum -y install java-11-openjdk \
      openssl \
      curl \
      which \
      rsyslog \
      libselinux-python \
      openldap \
      openldap-servers \
      compat-openldap \
      openldap-clients \
      openldap-devel \
      nss-pam-ldapd
      

RUN echo $'[Confluent.dist]\n\
name=Confluent repository (dist)\n\
baseurl=https://packages.confluent.io/rpm/7.2/$releasever\n\
gpgcheck=1\n\
gpgkey=https://packages.confluent.io/rpm/7.2/archive.key\n\
enabled=1\n\
\n\
[Confluent]\n\
name=Confluent repository\n\
baseurl=https://packages.confluent.io/rpm/7.2\n\
gpgcheck=1\n\
gpgkey=https://packages.confluent.io/rpm/7.2/archive.key\n\
enabled=1' >> /etc/yum.repos.d/confluent.repo


RUN rpm --import https://packages.confluent.io/rpm/7.2/archive.key && \
    yum clean all && \
    yum -y install confluent-platform-7.2.1-1.noarch.rpm \
      confluent-security