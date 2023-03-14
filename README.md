# Docker Container for LaTeX build

This is how to build a Debian container for compiling LaTeX documents. For a project we had
to build a complex report using a lot of LaTeX and Python features. This container provides a consistent
build environment for all project participants.
The LaTeX environment should be pretty complete.


## Build the image for docker

This is only required once.
```
docker build -t claus/latex .
```

## Run LaTeX


### Run and remove container afterwards (recommended)

Run inside the report dir:

```
docker run -u "$(id -u):$(id -g)" -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex			# Get a shell

docker run -u "$(id -u):$(id -g)" -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex make		# Build the report
docker run -u "$(id -u):$(id -g)" -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex make clean	# Clean up
```

Explanation of parameters:
* __*-it*__ : makes command interactive
* __*--name latexbuild*__ : gives container a name
* __*--rm*__ : deletes container afer use
* __*-v "$(pwd)":/mnt*__ : creates bind mount for the local dir to /mnt in the container
* __*-u "$(id -u):$(id -g)"*__ : run as current user and group inside container

__The container is spawned from the image for every build and is discarded afterwards. Only files in the
mounted report directory are modified.__

### Run bash and keep container (only for testing/debugging)

```
docker run -u "$(id -u):$(id -g)" -it --name latexbuild -v "$(pwd)"/report:/mnt claus/latex bash
```


## Copy the image to another computer

This is an alternative if you do not want to build the image, e.g. if you want to keep one state, and you want to
have the image on multiple hosts.

```
docker save -o docker-latex.image claus/latex

docker load -i docker-latex.image
```


