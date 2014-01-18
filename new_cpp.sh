#!/bin/bash

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "usage: new_cpp [options] project_name"
            exit 0
            ;;
        *)
            PROJECT_NAME=$1
            break;
            ;;
    esac
done

echo "Creating project:" $PROJECT_NAME

pushd ./cpp
mkdir $PROJECT_NAME
cp template/* $PROJECT_NAME

pushd $PROJECT_NAME

cmake .
make
./experiment

gvim main.cpp &
