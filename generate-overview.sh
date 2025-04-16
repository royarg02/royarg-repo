#!/bin/sh

# Generate list of package names, versions and their descriptions

set -e

cat << END
┌─────────────────────────────────────────────────────────┐
│ Generating repository overview...                       │
└─────────────────────────────────────────────────────────┘
END

# Arch: x86_64
cd static/os/x86_64

tmp=$(mktemp)
for package in ./*.pkg.tar.zst; do
  packageinfo="$(pacman -Qip "$package")"
  name="$(echo "$packageinfo" | sed -nr 's/^Name *: //p')"
  version="$(echo "$packageinfo" | sed -nr 's/^Version *: //p')"
  description="$(echo "$packageinfo" | sed -nr 's/^Description *: //p')"
  printf "%s %s %s\n" "$name" "$version" "$description" >> "$tmp"
done

column --table --table-columns-limit 3 "$tmp" | tee 0-royarg-repo-overview.txt

cat << END
┌─────────────────────────────────────────────────────────┐
│ Repository overview generated!                          │
└─────────────────────────────────────────────────────────┘
END

