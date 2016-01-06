Docker: Node and Go dev environment
===================================

Build and development environment for Node and Go language in a Docker container.

* Clone repo
```bash
git clone https://github.com/lindep/docker_dev_env.git build_dev
```
* Download latest Linux 64-bit [Go binaries](https://golang.org/dl/) and extract into go directory. The docker build process will copy the contents of this directory to /usr/local/go and set environment variables.
* Build docker image.

```bash
docker build --tag "image_name" .
```

Docker build will install latest Node v4.x version via nvm and set as the default version.
When using the image any other version can be installed using nvm i.e. install node 5
```
. ~/.nvm/nvm.sh
nvm install node 5
nvm ls
```

Create Golang [workspaces](https://golang.org/doc/code.html#Workspaces) environment 

```bash
mkdir -p ~/go_src/src
mkdir -p ~/go_src/pkg
mkdir -p ~/go_src/bin
```

The GOPATH env variable need to be mapped form /go_path in container 
to a DIR on the host where Go src files are
then start the image
```
docker run -it -v ~/go_src:/go_path --name dev_image image_name bash
```
source node environment via nvm.
```bash
. ~/.nvm/nvm.sh
nvm use default
```
