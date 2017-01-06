FROM laslabs/clouder-python-exec:latest
MAINTAINER Dave Lasley <dave@laslabs.com>

RUN apk add --no-cache libffi-dev \
                       openssl \
                       openssl-dev \
                       python3-dev

RUN pip install cryptography==1.7.1

RUN apk del build-base \
            libffi-dev \
            openssl-dev \
            python3-dev

COPY ./bin/* /usr/bin/

CMD ["openssl"]
