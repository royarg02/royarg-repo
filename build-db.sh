#!/bin/sh -x

# Database build script for royarg-repo
# - Change directory to location of package files
# - Build database using repo-add

# Immediately exit upon fail of any command
set -e

cat << END
╔════════════════════════════════════════════════════════════════════════════╗
║ Building the repo database...                                              ║
╚════════════════════════════════════════════════════════════════════════════╝
END

## Arch: x86_64
cd os/x86_64

## repo-add
## List the packages version sorted, keeping lower revision number before the
## greater one
repo-add --sign --new --remove royarg-repo.db.tar.gz $(ls --sort=version ./*.pkg.tar.zst)

cat << END
╔════════════════════════════════════════════════════════════════════════════╗
║ The database has been updated!                                             ║
╚════════════════════════════════════════════════════════════════════════════╝
END
