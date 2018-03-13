# Docker Container for LaTeX build

This is how to build a Debian container for compiling LaTeX documents.

## Build the image for docker

```
docker build -t claus/latex .
```

## Run LaTeX

1. Checkout the report to "report"

### Run once and keep container (only for testing)

```
docker run -it --name latexbuild -v "$(pwd)"/report:/mnt claus/latex bash
```

### Run and remove container aferwards (recommended)

Run inside the report dir:

```
docker run -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex		# Get a shell

docker run -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex make
docker run -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex make clean
```

* __*-it*__ : makes command interactive
* __*--name latexbuild*__ : gives container a name
* __*--rm*__ : deletes container afer use
* __*-v "$(pwd)":/mnt*__ : creates bind mount for the local dir to /mnt in the container


## Copy the image to another computer

```
docker save -o docker-latex.image claus/latex

docker load -i docker-latex.image
```


