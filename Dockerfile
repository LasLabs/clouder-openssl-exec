FROM laslabs/clouder-python-exec:latest
MAINTAINER Dave Lasley <dave@laslabs.com>

RUN apk add --no-cache libffi-dev \
                       openssl \
                       openssl-dev \
                       python3-dev

RUN pip install cryptography

RUN apk del build-base \
            libffi-dev \
            openssl-dev \
            python3-dev

COPY ./bin/* /usr/bin/
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["openssl"]
