#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# Build the project.
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="$(date '+%d-%m-%Y %H:%M:%S')"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin gh-staging
git subtree push --prefix=public https://github.com/8574e5b7f5ebe4/blog.git gh-pages
