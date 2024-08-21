FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_db.sh init_db.sh
RUN chmod +x /init_db.sh

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

CMD ["/init_db.sh"]

