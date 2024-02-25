#!/bin/bash

# Build the Docker image
docker build -t elk_llvm_fuzz .

# Create a temporary container to extract the binary
container_id=$(docker create elk_llvm_fuzz)

#If build directory does not exist, create it
if [ ! -d build ]; then
  mkdir build
fi

host_directory=$(pwd)/build

# Copy the binary from the container to the host
docker cp $container_id:/build/elk $host_directory/elk

# Clean up: Remove the temporary container
docker rm $container_id

echo "Binary copied to $host_directory"
