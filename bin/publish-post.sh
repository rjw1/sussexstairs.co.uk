#!/bin/bash
# script to publish a draft post
DRAFT=$1
DATE=`date +%Y-%m-%d`
POST="_posts/$DATE-`basename $DRAFT`"

if [ ! -e $DRAFT ]
then
  echo "$DRAFT doesnt exist"
  exit 1
fi

if [ -e $POST ]
then
  echo "$POST already exists"
  exit 1
fi

git mv $DRAFT $POST
git ci
