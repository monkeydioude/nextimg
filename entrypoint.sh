#!/bin/bash

if [ -z $TYPESCRIPT ]; then
    TYPESCRIPT=1
fi

cd /app

if [ ! -f "package.json" ]; then
    echo "[INFO] package.json doesn't exist = new project."

    echo "[INFO] copying base package.json."
    mv /package.json .

    echo "[INFO] installing base dependencies"
    npm install next react react-dom

    if [ ! -f "pages" ]; then
        echo "[INFO] setting mandatory 'pages' directory."
        mkdir pages
    fi

    echo "[INFO] copying dead simple HomePage 'index.js' routing file into 'pages' directory."
    mv /index.js pages/

    if [ $TYPESCRIPT = 1 ]; then
        echo '$TYPESCRIPT == 1. Installing TypeScript types.'
        touch tsconfig.json
        npm install --save-dev typescript @types/react @types/node
        mv pages/index.js pages/index.tsx
    fi
else
    echo "[INFO] package.json exists = run project."
    npm install
fi

chown -R 1000:1000 .

echo "[INFO] Running dev server."
npm run dev