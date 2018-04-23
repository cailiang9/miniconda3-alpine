FROM frolvlad/alpine-glibc:latest

MAINTAINER Cailiang

ENV PATH=/conda/bin:$PATH \
    CONDA_VER=4.4.10 \
    MINICONDA=Miniconda3-latest-Linux-x86_64.sh

RUN apk add --no-cache --update-cache wget bzip2 bash openssh \
    && wget -q --no-check-certificate https://repo.continuum.io/miniconda/$MINICONDA \
    && /bin/bash $MINICONDA -b -p /conda \
    && rm -rf /root/.continuum /conda/pkgs/* \
    && rm $MINICONDA

CMD ["/bin/bash"]
