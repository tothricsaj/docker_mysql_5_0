FROM kuborgh/mysql-5.0

MAINTAINER tothricsaj "ricktothdevelop@gmail.com"

COPY ./entrypoint.sh /mysql/entrypoint.sh
COPY ./pepsi.sh /mysql/pepsi.sh

RUN useradd -mUG sudo mysql \
&& echo 'mysql:mysql' | chpasswd && \
apt-get update && apt-get install -y mysql-client

RUN rm -rf /mysql/data/*

CMD /mysql/entrypoint.sh && /mysql/bin/mysqld_safe --user=mysql && /mysql/pepsi.sh && sleep infinity
