#!/bin/sh

if command -v npm > /dev/null; then
  npm i --location=global \
    yarn \
    pnpm \
    npm \
    degit \
    eslint \
		ls_emmet \
		neovim \
		prettier \
		sass \
		typescript-language-server \
		typescript
fi
