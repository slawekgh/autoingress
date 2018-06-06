FROM ubuntu:16.04
COPY kubectl /bin/
COPY autoingress.sh /
RUN chmod 755 /autoingress.sh
RUN chmod 755 /bin/kubectl
CMD /autoingress.sh
