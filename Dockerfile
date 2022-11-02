FROM ubuntu

ARG userID
ARG userName
ENV HOME /home/$userName

RUN apt-get update && apt-get upgrade -y && apt-get install wget -y
COPY download.sh .
RUN sh ./download.sh
RUN dpkg -i --force-depends virtualc.deb
RUN apt-get install -y -f

USER $userID
ENTRYPOINT /usr/bin/virtualc
