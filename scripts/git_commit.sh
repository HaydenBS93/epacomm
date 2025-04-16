#!/bin/bash

# Simple script to commit with a title and description

# Prompt for the title and description
read -p "Commit Title: " title
echo "Commit Description (end with CTRL+D):"
description=$(</dev/stdin)

# Commit using both
git commit -m "$title" -m "$description"
