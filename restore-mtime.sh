#!/bin/sh
# Script to set the modification date of files in "static/" to the the time of
# the most recent commit
# https://stackoverflow.com/a/2179876

for file in $(git ls-files -z "static/" | xargs -0); do
  time="$(git log --pretty=format:%cd -n 1 \
                  --date=format:%Y%m%d%H%M.%S --date-order -- "$file")"
  if [ -z "$time" ]; then
    echo "ERROR: skipping '$file' -- no git log found" >&2
  else
    touch -m -t "$time" "$file"
  fi
done

