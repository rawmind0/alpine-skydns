alpine-skydns 
==============

This image is the skydns base. It comes from [alpine-base][alpine-base].

## Build

```
docker build -t rawmind/alpine-skydns:<version> .
```

## Versions

- `2.5.3` [(Dockerfile)](https://github.com/rawmind0/alpine-skydns/blob/2.5.3/Dockerfile)

## Configuration

This image runs [skydns][skydns] with monit. skydns is started with user and group "skydns".

Besides, you can customize the configuration in several ways:

### Default Configuration

Etcd is installed with the default configuration and some parameters can be overrided with env variables:

- ETCD_MACHINES=${ETCD_MACHINES:-"http://etcd:2379"}
- SKYDNS_ADDR=${SKYDNS_SDDR:-"0.0.0.0:5353"}
- SKYDNS_DOMAIN=${SKYDNS_DOMAIN:-"dev.local"} 
- SKYDNS_NAMESERVERS=${SKYDNS_NAMESERVERS:-"8.8.8.8:53,8.8.4.4:53"} 
- SKYDNS_PATH_PREFIX=${SKYDNS_PATH_PREFIX:-"skydns"}


### Custom Configuration

Etcd is installed under /opt/etcd and make use of /opt/etcd/bin/etcd-source.sh to generate env variables.

You can edit this files in order customize configuration

You could also include FROM rawmind/alpine-etcd at the top of your Dockerfile, and add your custom config.



[alpine-monit]: https://github.com/rawmind0/alpine-monit/
[skydns]: https://github.com/skynetservices/skydns

