# Find clang-tidy with find_program
# Custom paths can be specified with CMAKE_PROGRAM_DIR
# Set CLANG_TIDY_COMMAND and CMAKE_CXX_CLANG_TIDY if found

function(clangtidy_setup)
    find_program(CLANG_TIDY_COMMAND NAMES clang-tidy)
    if(NOT CLANG_TIDY_COMMAND)
        message(FATAL_ERROR "CMake_RUN_CLANG_TIDY is ON but clang-tidy is not found!")
    endif()
    set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}" PARENT_SCOPE)
endfunction()

