#!/bin/bash

echo "Installing Checkov..."
pip install checkov


echo "Running Checkov scan on terraform/ folder..."
checkov -d .
