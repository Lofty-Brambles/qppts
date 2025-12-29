#!/bin/bash

for file in $(ls slides/*.md | sed 's/slides\/\|\.md//g'); do
    slidev build "./slides/${file}.md" --base "/$1/${file}/" --out "../dist/${file}/"
done

cp base.html dist/index.html