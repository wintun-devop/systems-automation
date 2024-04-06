#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
. ~/.nvm/nvm.sh
nvm ls-remote
nvm install --lts
node -e "console.log('Running Node.js ' + process.version)"
