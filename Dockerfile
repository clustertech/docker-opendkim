FROM centos:7
ENV container docker
RUN yum install -y epel-release; \
yum install -y opendkim; \
yum clean all; \
sed -i 's/^KeyFile/# KeyFile/' /etc/opendkim.conf; \
mv /etc/opendkim.conf /etc/opendkim/opendkim.conf; \
mkdir /etc/opendkim-keys
COPY . /
CMD /startopendkim.sh
