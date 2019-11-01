cmake_minimum_required (VERSION 2.8)

project (experiment)

message("Boost: ${USE_BOOST}, ${BOOST_PATH}")

if (${USE_BOOST})
    include_directories("${BOOST_PATH}")
endif()

add_executable(experiment main.cpp)
