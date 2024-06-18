#!/usr/bin/env bash

shellcheck --shell=bash --external-sources \
    bin/* --source-path=template/lib/ \
    lib/* \
    scripts/*

# Run shfmt on all shell scripts.
shfmt -i 4 --language-dialect bash --diff \
	"$(find . -not -path './.git*' -type f -exec file {} \; | grep 'shell script' | cut -d: -f1)"
