#!/bin/bash

echo "Are you sure that do you want delete all unused images? Yes/No"
read input

if [ "$input" == "Yes" ]; then
  docker image prune -a -f
elif [ "$input" == "No" ]; then
  echo "Nothing to do, Bye!"
else
  echo "Choose correct Option"
fi
