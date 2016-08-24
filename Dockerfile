FROM cloudbees/jnlp-slave-with-java-build-tools

MAINTAINER kuldeepd@cybage.com

USER root

RUN apt-get install apt-transport-https ca-certificates



RUN apt-get update

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D


RUN rm /etc/apt/sources.list.d/docker.list
RUN touch /etc/apt/sources.list.d/docker.list |  echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" >> /etc/apt/sources.list.d/docker.list



RUN apt-get update


RUN apt-get install docker-engine

RUN service docker start




RUN apt-get -y install php5-cli php5-common php5-mysql php5-xdebug libapache2-mod-php5 php5-xsl php5-mcrypt mcrypt

RUN find /etc/php5/cli/conf.d/ -name "*.ini" -exec sed -i -re 's/^(\s*)#(.*)/\1;\2/g' {} \;
RUN find /etc/php5/cli/ -name "*.ini" -exec sed -i -re 's/^(\s*)#(.*)/\1;\2/g' {} \;

RUN php5enmod mcrypt

