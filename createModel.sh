#!/bin/bash
# This takes in JSON and creates a model file.
# Requires JQ

# Get first argument
json=$1

# Check if jq is installed
if ! [ -x "$(command -v jq)" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

# Check if there are any arguments
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

# Get the model name.
modelName=$(echo $json | jq -r '.name')

echo """<?php
/**
 * $modelName Model
*/
class $modelName extends Model {
    public function __construct() {
        parent::__construct();
    }
}
"""

