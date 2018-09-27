#!/bin/sh

if [ ! -z TRAVIS_TAG ]; then
  sed -i "s/config.version = \"0.1.2\"/config.version = \"$TRAVIS_COMMIT\"/g" mod/game/options.rpy;
  cat mod/game/options.rpy | grep config.version;
else
  sed -i "s/define config.version = \"0.1.2\"/define config.version = \"$TRAVIS_TAG\"/g" mod/game/options.rpy;
  cat mod/game/options.rpy | grep config.version;
fi