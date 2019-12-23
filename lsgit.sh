#!/bin/bash

if [[ -z "$1" ]];
then
  echo "Usage: lsgit.sh [login_name_on_github]";
else
  curl -s https://api.github.com/users/$1/repos?per_page=1000 | grep -oP '(?<="git_url": ").*(?="\,)'
fi
