#!/bin/bash

for file in $(ls slides/*.md | sed 's/slides\/\|\.md//g'); do
    slidev build "./slides/${file}.md" --base "/$1/${file}/" --out "../dist/${file}/"
done

for file in $(ls pages/*.html | sed 's/pages\/\|\.html//g'); do
    cp "./pages/${file}.html" "dist/${file}.html"
done

cp Quantum_Physics-Informed_Neural_Networks.pdf dist/Quantum_Physics-Informed_Neural_Networks.pdf
