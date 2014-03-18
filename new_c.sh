#!/bin/bash


usage() {
    echo "usage: new_c [options] project_name"
    exit 0
}


# Parse options.
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            usage
            ;;
       #--boost-version)
       #     shift
       #     ;;
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

if [ ! -d ./projects/c ]; then
    mkdir -p ./projects/c
fi

pushd ./projects/c
mkdir $PROJECT_NAME
cp ../../templates/c/* $PROJECT_NAME

pushd $PROJECT_NAME

#echo "CMAKE_ARGUMENTS: $CMAKE_ARGUMENTS"

#cmake $CMAKE_ARGUMENTS .
cmake .
make
./experiment

gvim main.c &

