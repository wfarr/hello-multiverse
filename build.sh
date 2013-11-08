#!/bin/bash

project="$1"

puppet apply -e "include projects::$project" --modulepath=./modules
