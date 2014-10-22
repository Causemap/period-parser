FROM pandeiro/oracle-jdk8
ENV LEIN_ROOT true

RUN wget -O /usr/bin/lein \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein

RUN lein

VOLUME ["/project"]

WORKDIR /project

EXPOSE 3000
CMD lein ring server-headless
