cmake_minimum_required (VERSION 2.8)

project (experiment)

message("Boost: ${NO_BOOST}, ${BOOST_PATH}")

if ((NOT ${NO_BOOST}) OR (NOT DEFINED(NO_BOOST)))
    include_directories("${BOOST_PATH}")
endif()

add_executable(experiment main.cpp)
