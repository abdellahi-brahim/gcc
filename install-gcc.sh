#!/bin/sh

# Define the repository URL and the tarball name
REPO_URL="https://github.com/abdellahi-brahim/gcc.git"
TARBALL_NAME="gcc-10.1.0.tar.gz"
DESTINATION_PATH="${HOME}/opt"

# Function to extract tarball based on its file type
extract_tarball() {
    case $1 in
        *.tar.bz2) tar xjf $1 -C "$DESTINATION_PATH" ;;
        *.tar.gz) tar xzf $1 -C "$DESTINATION_PATH" ;;
        *.tar.xz) tar xJf $1 -C "$DESTINATION_PATH" ;;
        *) echo "Unknown tarball type: $1"; exit 1 ;;
    esac
}

# Clone the repository
git clone "$REPO_URL" gcc_repo
cd gcc_repo

# Check if the tarball exists
if [ ! -f "$TARBALL_NAME" ]; then
    echo "Error: Tarball $TARBALL_NAME not found in the repository."
    exit 1
fi

# Extract the tarball
extract_tarball "$TARBALL_NAME"

# Activate the new GCC
source "${DESTINATION_PATH}/gcc-10.1.0/activate"

# Print GCC version to verify
gcc --version

# Cleanup: Remove the cloned repository
cd ..
rm -rf gcc_repo

echo "GCC activation complete!"
