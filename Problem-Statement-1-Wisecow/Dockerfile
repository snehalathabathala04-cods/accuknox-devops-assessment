
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fortune-mod \
        fortunes \
        cowsay \
        netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:${PATH}"

WORKDIR /opt/wisecow

COPY wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["bash", "./wisecow.sh"]

