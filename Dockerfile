FROM amazonlinux:latest

RUN amazon-linux-extras install -y

RUN yum update -y \
    && yum install \
        systemd \
        tar \
        unzip \
        sudo \
        gcc-c++ \
        make \
        -y

RUN amazon-linux-extras install -y docker
RUN systemctl enable docker

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install

RUN useradd "ec2-user" && echo "ec2-user ALL=NOPASSWD: ALL" >> /etc/sudoers

CMD ["/sbin/init"]
