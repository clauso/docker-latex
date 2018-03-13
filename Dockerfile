FROM debian:stretch

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	make \
	texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	python3-pygments \
	python-pygments \
	python3-pip \
	python3-cairosvg \
	python3-cssselect \
	python3-inflect \
	latexmk \
	&& apt-get autoremove \
    && apt-get autoclean \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/
RUN pip3 install pygal tinycss

WORKDIR /mnt
CMD ["bash"]
