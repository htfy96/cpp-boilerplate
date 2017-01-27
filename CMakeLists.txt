cmake_minimum_required(VERSION 3.1)
project(example)

# Change all `example` to your project name!
set(example-build_tests OFF CACHE BOOL "Whether to build tests")

# Enable C++14
set (CMAKE_CXX_STANDARD 14)

################################
# Find thread
################################
find_package(Threads REQUIRED)

################################
# Catch
################################
set(Catch_INCLUDE_DIR vendor/Catch/include)

##################################
# Spdlog
##################################
set(spdlog_SOURCE_DIR vendor/spdlog)
include_directories(${spdlog_SOURCE_DIR}/include)


##################################
include_directories(src)

set(example_SOURCE src/example/example.hpp src/example/example.cpp)

add_library(example STATIC ${example_SOURCE})
target_link_libraries(example ${CMAKE_THREAD_LIBS_INIT})

if (example-build_tests)
    enable_testing()

    add_executable(example-test test/example_test.cpp test/test_main.cpp)
    target_include_directories(example-test PUBLIC ${Catch_INCLUDE_DIR})
    target_link_libraries(example-test example)


    add_test(example_test example-test)
endif()
