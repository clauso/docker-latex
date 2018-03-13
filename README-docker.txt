
# Docker Container for LaTeX build

## Build the image for docker

	docker build -t claus/latex .


## Run the latex build

1. Checkout the report to "report"

### Run once and keep container
docker run -it --name latexbuild -v "$(pwd)"/report:/mnt claus/latex bash


### Run and remove container aferwards (recommended)

Run inside the report dir:

docker run -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex		# Get a shell

docker run -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex make
docker run -it --name latexbuild --rm -v "$(pwd)":/mnt claus/latex make clean




### Copy the image to another computer

docker save -o <save image to path> <image name>

docker load -i <path to image tar file>
