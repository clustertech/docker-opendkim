FROM centos:7
ENV container docker
RUN curl -Lo /tini https://github.com/krallin/tini/releases/download/v0.18.0/tini-amd64; \
chmod 755 /tini
RUN yum -y update; \
yum install -y epel-release rsyslog; \
yum install -y opendkim; \
yum clean all; \
sed -i 's/^KeyFile/# KeyFile/' /etc/opendkim.conf; \
mv /etc/opendkim.conf /etc/opendkim/opendkim.conf; \
mkdir /etc/opendkim-keys
COPY . /
ENTRYPOINT ["/tini", "/startopendkim.sh"]
