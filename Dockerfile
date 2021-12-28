FROM debian:stable-slim

LABEL maintainer="moosool" 

RUN useradd -r dogecoin \
  && apt-get update -y \
  && apt-get install -y curl gnupg gosu \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DOGECOIN_VERSION=1.14.5
ENV DOGECOIN_DATA=/home/dogecoin/.dogecoin

RUN curl -SLO https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz 
RUN tar --strip=2 -xzf ./dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz -C /usr/local/bin && \
    rm ./dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["/home/dogecoin/.dogecoin"]

EXPOSE 22555

ENTRYPOINT ["/entrypoint.sh"]

CMD ["dogecoind"]
