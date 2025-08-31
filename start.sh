#!/bin/sh

if [ -z "$SHELLED" ]; then
    export SHELLED=1
    exec "$SHELL" "$0" "$@"
fi

if ! command -v node >/dev/null 2>&1; then
    echo "Error: Node.js is not installed. Install Node.js and try again."
    exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
    echo "Error: npm is not installed. Install npm and try again."
    exit 1
fi

if ! command -v pnpm >/dev/null 2>&1; then
    echo "Error: pnpm is not installed. Install pnpm and try again."
    exit 1
fi

pnpm i
pnpm dev

