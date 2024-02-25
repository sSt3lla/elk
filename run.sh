#!/bin/bash

#Check corpus and output directory exist
if [ ! -d CORPUS_DIR ]; then
  echo "Corpus directory does not exist"
  exit 1
fi

#Check output directory exists, creates it if it doesn't
if [ ! -d OUTPUT_DIR ]; then
  mkdir OUTPUT_DIR
fi

cd OUTPUT_DIR

#If the symlink to the elk binary does not exist, create it
if [ ! -L elk ]; then
  ln -s $PWD/../elk $PWD/elk
fi

./elk -fork=$(nproc) ../CORPUS_DIR -max_len=128 -dict=../js.dict -timeout 800
cd ..