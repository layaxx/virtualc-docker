FROM i386/ubuntu

ARG userID
ARG userName
ENV HOME /home/$userName

RUN apt-get update && apt-get install -y wget
RUN wget https://sites.google.com/site/virtualcide/virtualc_1.8.0_i386.deb -O virtualc.deb
RUN dpkg -i --force-depends virtualc.deb
RUN apt-get install -y -f

USER $userID
ENTRYPOINT /usr/bin/virtualc
