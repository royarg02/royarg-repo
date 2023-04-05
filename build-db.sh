#!/bin/sh -x

# Database build script for royarg-repo
# - Change directory to location of package files
# - Build database using repo-add

set -e

cat << END
╔════════════════════════════════════════════════════════════════════════════╗
║ Building the repo database...                                              ║
╚════════════════════════════════════════════════════════════════════════════╝
END

## Arch: x86_64
cd os/x86_64

## repo-add
## -s: signs the packages
## -n: only add new packages not already in database
## -R: remove old package files when updating their entry
repo-add -s -n -R royarg-repo.db.tar.gz << EOF
ls *.pkg.tar.zst | sort -nr
EOF

cat << END
╔════════════════════════════════════════════════════════════════════════════╗
║ The database has been updated!                                             ║
╚════════════════════════════════════════════════════════════════════════════╝
END
