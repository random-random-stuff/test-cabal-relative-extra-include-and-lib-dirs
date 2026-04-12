#! /usr/bin/env bash
#
# File: go-commandline.sh
#
# Created: 13 April 2026
#

# treat undefined variable substitutions as errors
set -u
# propagate errors from all parts of pipes
set -o pipefail

function execVerbose() {
    echo "${@}"
    "${@}"
}

(cd /home/sergey/projects/haskell/projects/thirdparty/cabal; cabal build --builddir /tmp/dist cabal-install:exe:cabal) && /tmp/dist/build/x86_64-linux/ghc-9.14.1/cabal-install-3.17.0.0/x/cabal/build/cabal/cabal build --builddir /tmp/dist-test --extra-lib-dirs deps --extra-include-dirs deps

exit 0

