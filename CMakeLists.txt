cmake_minimum_required(VERSION 3.9)
project(example)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)

# Change all `example` to your project name!
set(example-build_tests OFF CACHE BOOL "Whether to build tests")

# If clang-format/clang-tidy is not in PATH,
# you should define CMAKE_PROGRAM_PATH to
# a list containing it

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
# Prepare variables
##################################
set(sources_to_format "")
set(targets_to_tidy "")


##################################
include_directories(src)

set(example_HDRS src/example/example.hpp)
set(example_SOURCE src/example/example.hpp src/example/example.cpp)

add_library(example STATIC ${example_SOURCE})
target_link_libraries(example ${CMAKE_THREAD_LIBS_INIT})

list(APPEND sources_to_format ${example_SOURCE} ${example_HDRS})
list(APPEND targets_to_tidy example)

if (example-build_tests)
    enable_testing()

    set(example_test_HDRS "")
    set(example_test_SOURCE test/example_test.cpp test/test_main.cpp)

    add_executable(example-test ${example_test_SOURCE})
    target_include_directories(example-test PUBLIC ${Catch_INCLUDE_DIR})
    target_link_libraries(example-test example)

    list(APPEND sources_to_format ${example_test_SOURCE} ${example_test_HDRS})
    list(APPEND targets_to_tidy ${example-test)


    add_test(example_test example-test)
endif()

# A target named "clangformat", use make clangformat to format all specified files
include(ClangFormat)
clangformat_setup(${sources_to_format})

# If this finds clang-tidy, it will automatically set CMAKE_CXX_CLANG_TIDY,
include(ClangTidy)
clangtidy_setup()
if (CLANG_TIDY_COMMAND)
    message(STATUS "Your clang-tidy path is: ${CMAKE_CXX_CLANG_TIDY}")
    set_target_properties(${targets_to_tidy} PROPERTIES
        CXX_CLANG_TIDY "${CMAKE_CXX_CLANG_TIDY}"
    )
endif()
