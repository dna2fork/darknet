#!/bin/bash

set -xe

# Clone COCO API
git clone git://github.com/pdollar/coco
cd coco

mkdir images
cd images

# Download Images
curl -L -O https://pjreddie.com/media/files/train2014.zip
curl -L -O https://pjreddie.com/media/files/val2014.zip

# Unzip
unzip -q train2014.zip
unzip -q val2014.zip

cd ..

# Download COCO Metadata
curl -L -O https://pjreddie.com/media/files/instances_train-val2014.zip
curl -L -O https://pjreddie.com/media/files/coco/5k.part
curl -L -O https://pjreddie.com/media/files/coco/trainvalno5k.part
curl -L -O https://pjreddie.com/media/files/coco/labels.tgz
tar xzf labels.tgz
unzip -q instances_train-val2014.zip

# Set Up Image Lists
paste <(awk "{print \"$PWD\"}" <5k.part) 5k.part | tr -d '\t' > 5k.txt
paste <(awk "{print \"$PWD\"}" <trainvalno5k.part) trainvalno5k.part | tr -d '\t' > trainvalno5k.txt

