#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# Show git remotes
echo -e "${CYAN}${BOLD}🔗 Git remotes:${RESET}"
git remote -v
echo ""

# Check if remote 'origin' exists
if ! git remote | grep -q "^origin$"; then
    echo -e "${YELLOW}⚠️ No remote 'origin' found.${RESET}"
    echo -e "${CYAN}Enter your remote repository URL (e.g., https://github.com/user/repo.git):${RESET} \c"
    read remote_url

    if [ -z "$remote_url" ]; then
        echo -e "${RED}❌ No URL entered. Skipping remote setup.${RESET}"
    else
        git remote add origin "$remote_url"
        echo -e "${GREEN}✅ Remote 'origin' added successfully.${RESET}"
    fi
else
    echo -e "${GREEN}✅ Remote 'origin' already exists.${RESET}"
fi
echo ""

# Ask before adding files
echo -e "${YELLOW}Do you want to add all files? (y/n):${RESET} \c"
read add_confirm

if [[ $add_confirm == "y" || $add_confirm == "Y" ]]; then
    git add .
    echo -e "${GREEN}✅ All files added.${RESET}"
else
    echo -e "${CYAN}Enter the specific file or folder you want to add:${RESET} \c"
    read target

    if [ -z "$target" ]; then
        echo -e "${RED}❌ No file or folder specified. Exiting...${RESET}"
        exit 0
    fi

    if [ -e "$target" ]; then
        git add "$target"
        echo -e "${GREEN}✅ Added: ${BOLD}$target${RESET}"
    else
        echo -e "${RED}❌ The file or folder '${BOLD}$target${RESET}${RED}' does not exist.${RESET}"
        exit 1
    fi
fi

# Ask before committing
echo -e "${YELLOW}Do you want to commit changes? (y/n):${RESET} \c"
read commit_confirm
if [[ $commit_confirm == "y" || $commit_confirm == "Y" ]]; then
    echo -e "${CYAN}Enter commit message:${RESET} \c"
    read msg
    git commit -m "$msg"
    echo -e "${GREEN}✅ Commit created.${RESET}"
else
    echo -e "${RED}❌ Skipped commit.${RESET}"
    exit 0
fi

# Ask before pushing
echo -e "${YELLOW}Do you want to push to a branch? (y/n):${RESET} \c"
read push_confirm
if [[ $push_confirm == "y" || $push_confirm == "Y" ]]; then
    echo -e "${CYAN}${BOLD}📋 Available branches:${RESET}"
    git branch
    echo ""
    
    echo -e "${CYAN}Enter branch name to push (leave blank for current):${RESET} \c"
    read branch

    if [ -z "$branch" ]; then
        branch=$(git rev-parse --abbrev-ref HEAD)
    fi

    echo -e "${YELLOW}You are about to push to branch:${RESET} ${BOLD}$branch${RESET}"
    echo -e "${YELLOW}Proceed? (y/n):${RESET} \c"
    read confirm_push

    if [[ $confirm_push == "y" || $confirm_push == "Y" ]]; then
        git push -u origin "$branch"
        echo -e "${GREEN}✅ Successfully pushed to branch '${BOLD}$branch${RESET}${GREEN}'.${RESET}"
    else
        echo -e "${RED}❌ Push cancelled.${RESET}"
    fi
else
    echo -e "${RED}❌ Push skipped.${RESET}"
fi
