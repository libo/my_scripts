#!/bin/zsh

# If we have a param then we execute that test and save its path for later
if [ "$#" -gt 0 ]; then
  echo "$@" > ~/.last_test
  bundle exec testrb -ltest $@

# there is no param, so we read from ~/.last_test
else
  bundle exec testrb -ltest $(cat ~/.last_test)
fi
