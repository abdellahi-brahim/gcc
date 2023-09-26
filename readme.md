# GCC Compiled Binaries

This repository contains the compiled binaries for GCC version 10.1.0. It provides an easy way to deploy GCC on similar systems without the need to compile from source, thus speeding up the setup process.

## Installation

To install and activate the GCC version provided in this repository, you can use the provided installation script. Execute the following command:

```bash
curl -sSL https://raw.githubusercontent.com/abdellahi-brahim/gcc/main/install-gcc.sh | bash
```

After running the script, you'll need to activate the new GCC in your current shell:

```bash
source /opt/gcc-10.1.0/activate
```

If you want the new GCC to be the default every time you open a new terminal, you can add the above `source` command to your `~/.bashrc` or `~/.bash_profile` file.

## Repository Structure

- `gcc-10.1.0`: Directory containing the compiled GCC binaries and related files.
- `compile-gcc.sh`: Script used for compiling GCC.
- `install-gcc.sh`: Script for installing and activating the provided GCC version.
- `gcc-10.1.0.tar.gz`: Tarball containing the compiled GCC binaries.

## Contributing

If you find any issues or have suggestions, please open an issue in the repository.
