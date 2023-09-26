#!/bin/sh

# Define the repository URL and the tarball name
REPO_URL="https://github.com/abdellahi-brahim/gcc.git"
TARBALL_NAME="gcc-10.1.0.tar.gz"
DESTINATION_PATH="${HOME}/opt"

# Clone the repository
git clone "$REPO_URL" gcc_repo
cd gcc_repo

# Check if the tarball exists
if [ ! -f "$TARBALL_NAME" ]; then
    echo "Error: Tarball $TARBALL_NAME not found in the repository."
    exit 1
fi

# Extract the tarball
tar -xzvf "$TARBALL_NAME" -C "$DESTINATION_PATH"

# Activate the new GCC
source "${DESTINATION_PATH}/gcc-10.1.0/activate"

# Print GCC version to verify
gcc --version

# Cleanup: Remove the cloned repository
cd ..
rm -rf gcc_repo

echo "GCC activation complete!"

