Docker: Node and Go dev environment
===================================

Build and development environment for Node and Go language in a Docker container.

1. Clone repo
```bash
git clone https://github.com/lindep/docker_dev_env.git build_dev
```
* Download latest Linux 64-bit [Go binaries](https://golang.org/dl/) and extract into go directory.  
The docker build process will copy the contents of this directory to **__/usr/local/go__** and set environment variables.
* Build docker image.
```bash
docker build --tag "image_name" .
```

Docker build will install latest Node v4.x version via nvm and set as the default.
If more Node/iojs versions are needed install using nvm i.e. install node 5
```bash
. ~/.nvm/nvm.sh
nvm install node 5
nvm ls
```

Create Golang [workspaces](https://golang.org/doc/code.html#Workspaces) environment on host. This directory will then be mapped to ***/go_path*** in container. The Go directory structure below is a mininum requirement but follow instructions from Go workspaces link.  

```bash
mkdir -p ~/go_src/src/github.com/userid/project
mkdir -p ~/go_src/pkg
mkdir -p ~/go_src/bin
```

The ***$GOPATH*** environment variable in the container will be set to ***/go_path***, so when starting the image ensure to map the directory above to the ***/go_path*** as in the docker run command below.
```bash
docker run -it -v ~/go_src:/go_path --name dev_image image_name bash
```
This will open a bash term in the container,  source node environment via nvm.
### Node
```bash
. ~/.nvm/nvm.sh
nvm use default
```

### Go

```bash
cd /go_path OR
cd $GOPATH
```
