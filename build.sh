#!/bin/bash

for file in $(ls slides/*.md | sed 's/slides\/\|\.md//g'); do
    slidev build "./slides/${file}.md" --base "/${file}/" --out "../dist/${file}/"
done
