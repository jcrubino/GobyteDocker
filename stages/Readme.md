## To Run All At Once
* `sh build.sh`

# Step By Step Build
Complete step by step for those new to Docker.  This step by step build is convenient for updating
the node configurations or the Gobyte codebase. Since Docker stores the builds as layers which can build upon one another, having various layers ready to build with goes fast once they are all in place.  Use `docker build --no-cache -f ...` to redo layer builds without using the layers being cached by the Docker Engine. 

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
  * `cp ../conf/gobyte-node.conf .`
  * `docker build -f gobyte-alpine-node.Dockerfile -t gobyte-node .`
  * (optional) `rm gobyte-node.conf`

## Create MasterNode
* Desc:
  * create configured Masternode image from **gobyte-alpine-binaries**
* Dockerfile:
  * gobyte-alpine-masternode.Dockerfile  
* Tag:
  * gobyte-masternode
* Cmd:
  * `cp ../conf/gobyte-masternode.conf .`
  * `docker build -f gobyte-alpine-masternode.Dockerfile -t gobyte-masternode .`
    * (optional) `rm gobyte-masternode.conf`
