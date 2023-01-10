#!/bin/sh

if command -v npm > /dev/null; then
  npm i -g npm
  npm i --location=global pnpm

  pnpm i -g \
    yarn \
    pnpm \
    degit \
    eslint \
		ls_emmet \
		neovim \
		prettier \
		sass \
		typescript-language-server \
		typescript \
    svelte-language-server
fi
