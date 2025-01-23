FROM ubuntu/mysql:8.0-20.04_beta
ARG MYSQL_ROOT_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ENV MYSQL_DATABASE=$MYSQL_DATABASE
RUN apt update
RUN apt install -y sudo
RUN apt install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN apt install -y nodejs
#RUN apt install -y npm 
RUN mkdir bookmania 
WORKDIR bookmania
COPY . . 
RUN npm install 
CMD ["/bookmania/run-docker.sh"]
#EXPOSE 3306 mysql
EXPOSE 3001