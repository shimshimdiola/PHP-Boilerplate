#!/bin/bash

# Show git remotes
git remote -v

# Ask before adding files
read -p "Do you want to add all files? (y/n): " add_confirm
if [[ $add_confirm == "y" || $add_confirm == "Y" ]]; then
    git add .
    echo "✅ Files added."
else
    echo "❌ Skipped adding files."
    exit 0
fi

# Ask before committing
read -p "Do you want to commit changes? (y/n): " commit_confirm
if [[ $commit_confirm == "y" || $commit_confirm == "Y" ]]; then
    read -p "Enter commit message: " msg
    git commit -m "$msg"
else
    echo "❌ Skipped commit."
    exit 0
fi

# Ask before pushing
read -p "Do you want to push to remote? (y/n): " push_confirm
if [[ $push_confirm == "y" || $push_confirm == "Y" ]]; then
    git push
else
    echo "❌ Push skipped."
fi
