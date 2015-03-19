FROM pandeiro/oracle-jdk8
ENV LEIN_ROOT true

RUN wget -O /usr/bin/lein \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein

COPY . /project
WORKDIR /project

RUN lein

EXPOSE 1337
CMD lein ring server-headless
