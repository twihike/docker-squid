# docker-squid

[![release](https://github.com/twihike/docker-squid/workflows/release/badge.svg)](https://github.com/twihike/docker-squid/actions)

## Usage

```shell
docker pull twihike/squid
docker run --name squid -d --rm -p 3128:3128 twihike/squid
curl -x localhost:3128 https://google.com
```
