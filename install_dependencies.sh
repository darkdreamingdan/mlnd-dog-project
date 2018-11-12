#!/usr/bin/env bash
if ! [ -x "$(command -v unzip)" ]; then
  echo 'Error: unzip is not installed.  Please install unzip package and try again' >&2
  exit 1
fi

echo 'Downloading dog dataset...'
wget https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/dogImages.zip
unzip dogImages.zip
rm dogImages.zip

echo 'Downloading human dataset...'
wget https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/lfw.zip
unzip lfw.zip
rm lfw.zip

echo 'Downloading VGG-16 bottleneck features'
mkdir -p bottleneck_features
cd bottleneck_features
wget https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/DogVGG16Data.npz

echo 'Done'
