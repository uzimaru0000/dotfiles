#!/usr/bin/env bash
APPLIST=""

for app in `brew list`; do
  APPLIST=$APPLIST:$app=0
done
for app in `brew cask list`; do
  APPLIST=$APPLIST:$app=1
done

echo "# app_name=isUseCask"
echo $APPLIST | tr ':' '\n'

