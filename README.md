Docker: Node and Go dev environment
===================================

Build and development environment for Node and Go language

* Clone repo
```bash
git clone https://github.com/lindep/docker_build_env.git build_dev
```
* Download Go binaries and extract into go directory.
* Create docker image.

```bash
docker build --tag "image_name" .
```

Node will be installed via nvm.

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
nvm use 4
```
