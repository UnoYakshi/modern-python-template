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


# Add and commit changes...
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git add src/__init__.py
git commit -m "chore(version): update to ${NEW_VERSION}"
git push origin HEAD:${GITHUB_REF}
