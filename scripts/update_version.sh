#!/bin/bash

set -e

# Read the version passed from semantic-release
NEW_VERSION=$1

echo "Updating __version__ to $NEW_VERSION..."

# Update __init__.py with the new version
sed -i "s/^__version__ = .*/__version__ = \"$NEW_VERSION\"/" src/__init__.py || {
  echo "Failed to update __version__"; exit 1;
}

echo "Updated __version__ to $NEW_VERSION. File's content:"
grep "__version__" src/__init__.py
