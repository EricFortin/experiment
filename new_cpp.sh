#!/bin/bash

# Load config for different machine setup.
source cpp/.experiment_config

# Define default options.
USE_BOOST=false


usage() {
    echo "usage: new_cpp [options] project_name"
    exit 0
}


# Parse options.
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            usage
            ;;
        --use-boost)
            USE_BOOST=true
            shift
            ;;
        --boost-version)
            shift
            BOOST_VERSION="$1"
            shift
            ;;
        *)
            PROJECT_NAME=$1
            break;
            ;;
    esac
done

if [[ -z "$PROJECT_NAME" ]] ; then usage
fi

# Create project, generate makefiles and build.
echo "Creating project:" $PROJECT_NAME

if [ ! -d ./projects/cpp ]; then
    mkdir -p ./projects/cpp
fi

pushd ./projects/cpp
mkdir $PROJECT_NAME
cp ../../templates/cpp/* $PROJECT_NAME

pushd $PROJECT_NAME

if $USE_BOOST ; then
    echo "Using Boost version: $BOOST_VERSION"
    CMAKE_ARGUMENTS="$CMAKE_ARGUMENTS -DUSE_BOOST=ON -DBOOST_PATH=$BOOST_PATH/$BOOST_VERSION/"
else
    CMAKE_ARGUMENTS="$CMAKE_ARGUMENTS"
fi

echo "CMAKE_ARGUMENTS: $CMAKE_ARGUMENTS"

cmake $CMAKE_ARGUMENTS .
make
