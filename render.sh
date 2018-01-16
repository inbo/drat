#!/bin/bash
git config --global user.email "bmk@inbo.be"
git config --global user.name "INBO CI"
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
git clone --depth=1 --branch=gh-pages git@github.com:inbo/drat.git
cd drat
if [[ $(git log -1 | grep "Render markdown") ]]; then
  echo "Done"
else
  r render.R
  git add --all
  git commit -m "Render markdown"
  git push origin
fi
cd ..
