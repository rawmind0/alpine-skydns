FROM rawmind/alpine-base:0.3.3-2
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Install compile and install skydns
ENV SKYDNS_VERSION=2.5.3a \
    SKYDNS_HOME=/opt/skydns \
    GOMAXPROCS=2 \
    GOROOT=/usr/lib/go \
    GOPATH=/opt/src \
    GOBIN=/gopath/bin 
ENV PATH=$PATH:$SKYDNS_HOME

RUN apk --update add bind-tools && mkdir -p ${SKYDNS_HOME} \
  && apk add go git gcc musl-dev \
  && mkdir -p ${GOPATH}; cd ${GOPATH} \
  && go get github.com/skynetservices/skydns \
  && cd $GOPATH/src/github.com/skynetservices/skydns \
  && CGO_ENABLED=0 go build -v -installsuffix cgo -ldflags '-extld ld -extldflags -static' -a -x . \
  && mv skydns ${SKYDNS_HOME}/ \
  && chmod +x ${SKYDNS_HOME}/skydns \
  && apk del go git gcc musl-dev \
  && rm -rf /var/cache/apk/* /opt/src 

WORKDIR /opt/skydns

ENTRYPOINT ["/opt/skydns/skydns"]
