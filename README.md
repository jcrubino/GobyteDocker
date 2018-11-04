# GobyteDocker
Dockerfiles for Building and Running Gobyte Containers for local regtesting


## Step One

* Desc:
  * compile berleydb 4.8 using Alpine linux
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
  * pull Gobyte binaries into plain Alpine with only runtime libs installed
* Dockerfile:
  * gobyte-alpine-binaries.Dockerfile  
* Tag:
  * gobyte-alpine-binaries
* Cmd:
  * `docker build -f gobyte-alpine-binaries.Dockerfile -t gobyte-alpine-binaries .`
