#!/bin/bash

# Define the repository URL and the tarball name
REPO_URL="https://github.com/abdellahi-brahim/gcc.git"
TARBALL_NAME="gcc-10.1.0.tar.gz"
DESTINATION_PATH="${HOME}/opt"

# Install git
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y git
elif command -v yum &> /dev/null; then
    sudo yum install -y git
else
    echo "Unsupported package manager. Please install git manually."
    exit 1
fi

# Install git-lfs
if command -v apt-get &> /dev/null; then
    # For apt-based systems (like Ubuntu and Debian)
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
    sudo apt-get install -y git-lfs
elif command -v yum &> /dev/null; then
    # For yum-based systems (like CentOS and RHEL)
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash
    sudo yum install -y git-lfs
else
    echo "Unsupported package manager. Please install git-lfs manually."
    exit 1
fi

# Clone the repository
git clone "$REPO_URL" gcc_repo
cd gcc_repo

# Pull the LFS content
git lfs pull

# Extract the tarball
tar xzf "$TARBALL_NAME" -C "$DESTINATION_PATH"

# Activate the new GCC
source "${DESTINATION_PATH}/gcc-10.1.0/activate"

# Print GCC version to verify
gcc --version

# Cleanup: Remove the cloned repository
cd ..
rm -rf gcc_repo

echo "GCC activation complete!"
