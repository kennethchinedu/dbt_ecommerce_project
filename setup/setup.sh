#!/bin/bash


ENV_NAME=dbt-env


echo "Creating virtual environment..."
python3 -m venv $ENV_NAME


echo "Activating virtual environment..."
source $ENV_NAME/bin/activate


echo "Upgrading pip..."
pip install --upgrade pip

# Install the requirements
echo "Installing requirements..."
pip install -r requirements.txt

# Notify the user
echo "Setup complete. Virtual environment '$ENV_NAME' is ready and activated."
