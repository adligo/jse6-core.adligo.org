#!/bin/bash
#include <unistd.h>
#
# This checksout the sub projects, which are ignored
# These are in alphabetical order


#
#  This clones all of Adligo Inc's adligo.org projects underneath
# the folder where this script is run.
#
# --------------------- Apache License LICENSE-2.0 -------------------
#
#  Copyright 2022 Adligo Inc

#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

# Thanks https://medium.com/@Drew_Stokes/bash-argument-parsing-54f3b81a6a8f
while (( "$#" )); do
  case "$1" in
    -a | --async)   async="y" ; shift 1  ;;
    -h | --help) help="y" ; shift 1 ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

function clone() {
  if [[ "$async" == "y" ]]; then
    clone_async $1 &
  else 
    git clone git@github.com:adligo/$1.git 
  fi
}

function clone_async() {
  #echo "cloning $1 async"
  git clone git@github.com:adligo/$1.git
  #echo "finished clone of $1"
  if [[ -z "$2" ]]; then
    echo "no branch for $1"
  else
    cd $1
    git checkout $2
  fi
}
clone artifactory_deploy.sh.adligo.org jse16

clone ctx.adligo.org jse6
clone ctx_tests.adligo.org jse6

clone eclipse.adligo.org jse6

clone gradle_kt_examples.adligo.org jse6
clone gwt_ctx_example.adligo.org jse6

clone i_ctx.adligo.org jse6
clone i_ctx4jse.adligo.org jse6
clone i_pipe.adligo.org jse6
clone i_tests4j.adligo.org jse6
clone i_threads.adligo.org jse6
clone i_threads4jse.adligo.org jse6

clone mockito_ext.adligo.org jse6

clone pipe.adligo.org jse6
clone pipe_tests.adligo.org jse6

clone tests4j.adligo.org jse6
clone tests4j_4mockito.adligo.org jse6
clone tests4j4jj.adligo.org jse6
clone tests4j4jj_tests.adligo.org jse6
clone threads.adligo.org jse6

wait
