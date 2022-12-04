FROM  centos:latest

MAINTAINER Masood

RUN dnf install -y httpd\
 zip\
 unzip

RUN firewall-cmd --permanent --add-service=https

RUN firewall-cmd --reload

RUN systemctl start httpd

RUN systemctl status httpd

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip photogenic.zip

RUN cp -rvf photogenic/* .

RUN rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
