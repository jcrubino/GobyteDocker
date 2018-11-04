# GobyteDocker
Dockerfiles for building and running [Gobyte](https://www.gobyte.network/) node and masternode containers for local regression tests; or for easier deployments.
Currently build-flow is in stages to easily configure up-to-date images as needed.
Can be done in one step, with Alpine lib removals during build process.


## Step One

* Desc:
  * compile Berkeley 4.8 using Alpine linux
* Dockerfile:
  * gobyte-alpine-base.Dockerfile  
* Tag:
  * gobyte-alpine-base
* Cmd:
  * `docker build -f gobyte-alpine-base.Dockerfile -t gobyte-alpine-base .`

## Step Two

* Desc:
  * compile Gobyte binaries using Alpine with Berkeley 4.8 image
* Dockerfile:
  * gobyte-alpine-compile.Dockerfile  
* Tag:
  * gobyte-alpine-compile
* Cmd:
  * `docker build -f gobyte-alpine-compile.Dockerfile -t gobyte-alpine-compile .`


## Step Three

* Desc:
  * pull Gobyte binaries into minimal Alpine image with runtime libs installed
* Dockerfile:
  * gobyte-alpine-binaries.Dockerfile  
* Tag:
  * gobyte-alpine-binaries
* Cmd:
  * `docker build -f gobyte-alpine-binaries.Dockerfile -t gobyte-alpine-binaries .`

## Create Basic Node
* Desc:
  * create configured node image from **gobyte-alpine-binaries**
* Dockerfile:
  * gobyte-alpine-node.Dockerfile  
* Tag:
  * gobyte-node
* Cmd:
  * `docker build -f gobyte-alpine-node.Dockerfile -t gobyte-node .`

## Create MasterNode
* Desc:
  * create configured Masternode image from **gobyte-alpine-binaries**
* Dockerfile:
  * gobyte-alpine-masternode.Dockerfile  
* Tag:
  * gobyte-masternode
* Cmd:
  * `docker build -f gobyte-alpine-masternode.Dockerfile -t gobyte-masternode .`
