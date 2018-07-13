FROM ubuntu:xenial

RUN apt-get update -y
RUN apt-get install -y \
  git wget \
  python \
  nodejs \
  cmake \
  default-jre
WORKDIR /root
RUN git clone https://github.com/juj/emsdk.git
RUN git clone https://github.com/opencv/opencv.git

WORKDIR /root/emsdk
RUN ./emsdk install latest
RUN ./emsdk activate latest

WORKDIR /root/opencv
RUN ["/bin/bash", "-c", "source /root/emsdk/emsdk_env.sh && \
    python ./platforms/js/build_js.py build_js && \
    python ./platforms/js/build_js.py build_wasm --build_wasm \
  "]

RUN mkdir /root/output
VOLUME /root/output
WORKDIR /root/output
