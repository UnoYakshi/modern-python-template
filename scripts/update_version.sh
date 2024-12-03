#!/bin/bash

# Read the version passed from semantic-release
NEW_VERSION=$1

# Update __init__.py with the new version
sed -i "s/__version__ = \'.*\'/__version__ = '$NEW_VERSION'/" src/__init__.py
