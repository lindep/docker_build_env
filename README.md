Docker: Node and Go dev environment
==================================

Build and development environment for Node and Go language

1. Clone repo
'''bash
git clone https://github.com/lindep/docker_build_env.git build_dev'''

2. Download Go binaries and extract into go DIR

Create docker image

docker build --tag "image_name" .

The GOPATH env variable need to be mapped form /go_path in container 
to a DIR on the host where Go src files are
then start the image

docker run -it -v ~/go_src:/go_path image_name bash
