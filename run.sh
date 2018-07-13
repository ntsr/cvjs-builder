#!/bin/bash

docker run --rm -v $(pwd)/output:/root/output cvjs cp -pr /root/opencv/build_js /root/output
docker run --rm -v $(pwd)/output:/root/output cvjs cp -pr /root/opencv/build_wasm /root/output
