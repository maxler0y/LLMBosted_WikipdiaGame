#!/bin/bash

# Specify the python version
PYTHON_VERSION=3.11.6

# Check if the correct version of Python is installed
if ! pyenv versions | grep -q $PYTHON_VERSION; then
  echo "Installing Python $PYTHON_VERSION..."
  pyenv install $PYTHON_VERSION
fi

# Set local Python version for the project
pyenv local $PYTHON_VERSION

# Create a virtual environment
python -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

echo "Setup is complete. The virtual environment is ready to use."
