[![](https://images.microbadger.com/badges/image/rawmind/alpine-skydns.svg)](https://microbadger.com/images/rawmind/alpine-skydns "Get your own image badge on microbadger.com")

alpine-skydns 
==============

This image is the skydns base. It comes from [alpine-base][alpine-base].

## Build

```
docker build -t rawmind/alpine-skydns:<version> .
```

## Versions

- `2.5.3-8` [(Dockerfile)](https://github.com/rawmind0/alpine-skydns/blob/2.5.3-8/Dockerfile)

## Configuration

This image runs [skydns][skydns] with monit. skydns is started with user and group "skydns".

Besides, you can customize the configuration in several ways:

### Default Configuration

Etcd is installed with the default configuration and some parameters can be overrided with env variables:

- ETCD_MACHINES=${ETCD_MACHINES:-"http://etcd:2379"}	# Multiple values separated by ,
- SKYDNS_ADDR=${SKYDNS_ADDR:-"0.0.0.0:53"}				# Address to bind
- SKYDNS_DOMAIN=${SKYDNS_DOMAIN:-"dev.local"} 			# Skydns authorizative domain
- SKYDNS_PATH_PREFIX=${SKYDNS_PATH_PREFIX:-"skydns"}	# skydns etcd prefix
- SKYDNS_NDOTS=${SKYDNS_NDOTS:-"1"}						# Minimum dot at name to forward query
- SKYDNS_NO_REC=${SKYDNS_NO_REC:-"true"}				# Enables or disables recursion
- SKYDNS_NAMESERVERS=${SKYDNS_NAMESERVERS:-""} 			# Dns forwarders 


### Custom Configuration

Etcd is installed under /opt/skydns and make use of /opt/skydns/bin/skydns-source.sh to source env variables.

You can edit this files in order customize configuration

You could also include FROM rawmind/alpine-skydns at the top of your Dockerfile, and add your custom config.

If you are running it in rancher, you could run [rancher-skydns][rancher-skydns] as a sidekick to get dynamic configuration.


## Example

See [rancher-example][rancher-example], that run kafka in a rancher system with dynamic configuration.


[alpine-monit]: https://github.com/rawmind0/alpine-monit/
[skydns]: https://github.com/skynetservices/skydns
[rancher-skydns]: https://hub.docker.com/r/rawmind/rancher-skydns/
[rancher-example]: https://github.com/rawmind0/alpine-skydns/tree/master/rancher
