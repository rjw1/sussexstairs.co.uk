#!/bin/bash
# script to generate a draft post
TITLE=$@
POST=${TITLE// /-}
if [ -e _drafts/${POST}.md ]
then
  echo "_drafts/${POST}.md already exists"
else
  echo "creating _drafts/${POST}.md"
  echo "---" >> _drafts/${POST}.md
  echo "layout: post" >> _drafts/${POST}.md
  echo "title: $TITLE" >> _drafts/${POST}.md
  echo "---" >> _drafts/${POST}.md

  git add _drafts/${POST}.md
  git ci _drafts/${POST}.md -m "Add a new draft post with the title $TITLE"
fi
