#!/bin/bash

set -euo pipefail

base_prefix="${1:-}"

escape_html() {
    sed \
        -e 's/&/\&amp;/g' \
        -e 's/</\&lt;/g' \
        -e 's/>/\&gt;/g'
}

render_markdown_page() {
    local input_file="$1"
    local output_file="$2"
    local page_title="$3"

    cat >"$output_file" <<EOF
<!doctype html>
<html lang="en" data-theme="auto">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>${page_title}</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.classless.min.css"
        />
        <script defer>
            /*!
             * Minimal theme switcher
             *
             * Pico.css - https://picocss.com
             * Copyright 2019-2024 - Licensed under MIT
             */

            const themeSwitcher = {
                _scheme: "auto",
                menuTarget: "details.dropdown",
                buttonsTarget: "a[data-theme-switcher]",
                buttonAttribute: "data-theme-switcher",
                rootAttribute: "data-theme",
                localStorageKey: "picoPreferredColorScheme",

                init() {
                    this.scheme = this.schemeFromLocalStorage;
                    this.initSwitchers();
                },

                get schemeFromLocalStorage() {
                    return (
                        window.localStorage?.getItem(this.localStorageKey) ??
                        this._scheme
                    );
                },

                get preferredColorScheme() {
                    return window.matchMedia("(prefers-color-scheme: dark)")
                        .matches
                        ? "dark"
                        : "light";
                },

                initSwitchers() {
                    const buttons = document.querySelectorAll(
                        this.buttonsTarget,
                    );
                    buttons.forEach((button) => {
                        button.addEventListener(
                            "click",
                            (event) => {
                                event.preventDefault();
                                this.scheme = button.getAttribute(
                                    this.buttonAttribute,
                                );
                                document
                                    .querySelector(this.menuTarget)
                                    ?.removeAttribute("open");
                            },
                            false,
                        );
                    });
                },

                set scheme(scheme) {
                    if (scheme == "auto") {
                        this._scheme = this.preferredColorScheme;
                    } else if (scheme == "dark" || scheme == "light") {
                        this._scheme = scheme;
                    }
                    this.applyScheme();
                    this.schemeToLocalStorage();
                },

                get scheme() {
                    return this._scheme;
                },

                applyScheme() {
                    document
                        .querySelector("html")
                        ?.setAttribute(this.rootAttribute, this.scheme);
                },

                schemeToLocalStorage() {
                    window.localStorage?.setItem(
                        this.localStorageKey,
                        this.scheme,
                    );
                },
            };

            if (document.readyState === "loading") {
                document.addEventListener("DOMContentLoaded", () =>
                    themeSwitcher.init(),
                );
            } else {
                themeSwitcher.init();
            }
        </script>
    </head>
    <body>
        <main>
            <nav>
                <ul></ul>
                <ul>
                    <li><strong>Themes: </strong></li>
                    <li><a href="#" data-theme-switcher="auto">Auto</a></li>
                    <li><a href="#" data-theme-switcher="light">Light</a></li>
                    <li><a href="#" data-theme-switcher="dark">Dark</a></li>
                </ul>
            </nav>
            <textarea id="markdown-source" hidden>
EOF

    escape_html <"$input_file" >>"$output_file"

    cat >>"$output_file" <<'EOF'
            </textarea>
        </main>
        <script type="module">
            import { marked } from "https://cdn.jsdelivr.net/npm/marked/lib/marked.esm.js";

            const markedContent = document.querySelector("#markdown-source")?.value ?? "";
            document.querySelector("main").innerHTML += marked.parse(markedContent);
        </script>
    </body>
</html>
EOF
}

for file in $(ls slides/*.md | sed 's/slides\/\|\.md//g'); do
    slide_base="/${file}/"
    if [ -n "$base_prefix" ]; then
        slide_base="/${base_prefix}/${file}/"
    fi
    slidev build "./slides/${file}.md" --base "$slide_base" --out "../dist/${file}/"
done

for markdown_file in pages/*.md; do
    [ -e "$markdown_file" ] || continue
    file_name="$(basename "$markdown_file" .md)"
    render_markdown_page "$markdown_file" "dist/${file_name}.html" "$file_name"
done

cp Quantum_Physics-Informed_Neural_Networks.pdf dist/Quantum_Physics-Informed_Neural_Networks.pdf
