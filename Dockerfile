FROM debian:stretch-slim

LABEL maintainer="claus.overbeck@abovo-it.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-utils
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		make \
		texlive \
		texlive-latex-extra \
		texlive-fonts-extra \
		texlive-extra-utils \
		texlive-lang-german \
		texlive-lang-english \
		latexmk \
		python3-pygments \
		python-pygments \
		python3-pip \
		python3-cairosvg \
		python3-cssselect \
		python3-inflect \
		python3-setuptools \
		python3-wheel \
		lmodern \
	&& apt-get autoremove \
    && apt-get autoclean \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/ \
	&& pip3 install pygal tinycss
RUN apt-get upgrade -y

WORKDIR /mnt
CMD ["bash"]
