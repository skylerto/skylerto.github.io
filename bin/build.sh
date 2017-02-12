#! /bin/bash

jekyll build
docker build -t skylerto.github.io:$(cat VERSION) .
