#!/bin/bash

# If we have a param then we execute that test and save its path for later
if [ "$#" -gt 0 ]; then
  echo "$@" > ~/.last_test
  test_path=$@
else
  # there is no param, so we read from ~/.last_test
  test_path=$(cat ~/.last_test)
fi
echo "Testing on: $test_path"

rspec_match="_spec.rb"
if test "${test_path#*$rspec_match}" != "$test_path"; then
  bundle exec rspec $test_path
else
  ruby -Itest -Ispec $test_path #--debug
fi
