#!/bin/bash

# If we have a param then we execute that test and save its path for later
if [ "$#" -gt 0 ]; then
  echo "$@" > ~/.last_test
  echo "Testing on: $@"
  # bundle exec testrb -ltest -b$(pwd) $@
  ruby -Itest -Ispec $@ #--debug

# there is no param, so we read from ~/.last_test
else
  echo "Testing on: $(cat ~/.last_test)"
  # bundle exec testrb -ltest -b$(pwd) $(cat ~/.last_test)
  ruby -Itest -Ispec $(cat ~/.last_test) #--debug
fi
