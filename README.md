### Basic NextJS TypeScript (default) project starter Docker Image

[hub.docker.com/repository/docker/drannoc/nextjs](https://hub.docker.com/repository/docker/drannoc/nextjs)

 > ```docker run -d -v $(pwd):/app -p 3000:3000 drannoc/nextjs```

This image behaves as follows:

```
Does ENV Var `CMD` exist ? Y [
    > execute CMD
    > exit
]
Project does NOT exist ? Y [
    > add `.gitignore`
        node_modules/
        .next/
    > add `package.json`
    > install `next react react-dom` (aka the basics)
    > add mandatory `pages` directory
    > TypeScript ? Y [
        > install TypeScript related types
        > add `pages/index.tsx`
    ] N [
        > add `pages/index.js`
    ]
] N [
    > npm install
]
> run dev server
```