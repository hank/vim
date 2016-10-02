#!/bin/sh
# Archives with all submodules
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <output archive>"
    exit
fi
python utils/git-archive-all/git_archive_all.py \
    -v --force-submodules \
    --format zip \
    $1
