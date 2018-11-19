# cpp-boilerplate
A modern boilerplate for C++ project, built on Cmake, Conan with Catch and spdlog.

**Now you are browsing the `v2` branch! See differences below**

[![Travis](https://img.shields.io/travis/htfy96/cpp-boilerplate.svg?style=flat-square)](https://travis-ci.org/htfy96/cpp-boilerplate)
[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![license](https://img.shields.io/github/license/htfy96/cpp-boilerplate.svg?style=flat-square)](https://github.com/htfy96/cpp-boilerplate/blob/v2/LICENSE)


## Test matrix

| Distribution | Compiler | `CMAKE_BUILD_TYPE` |  Status  |
|--------------|----------|--------------------|----------|
| Ubuntu 18.04 | `g++-6`| `Debug`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/v2/1) |
| Ubuntu 18.04 | `g++-6`| `Release`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/v2/2) |
| Ubuntu 18.04 | `g++-7`| `Debug`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/v2/3) |
| Ubuntu 18.04 | `g++-7`| `Release`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/v2/4) |
| Ubuntu 18.04 | `clang++-6`| `Debug`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/v2/5) |
| Ubuntu 18.04 | `clang++-6`| `Release`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/v2/6) |

## How to use this

1. Download this project: `git clone --recursive https://github.com/htfy96/cpp-boilerplate.git`
2. Change `example` in filenames/namespaces under `src/`, `test/` into `your_project`
3. Change `CMakeLists.txt`: `example` -> `your_project`
4. Change `.travis.yml`: `example` -> `your_project`
5. Change `README.md`: `cpp-boilerplate` -> `your_project`
6. Enable Travis-CI at https://travis-ci.org
7. Push & Enjoy it!

### Build
[Install Conan first](https://docs.conan.io/en/latest/installation.html)

```
mkdir -p build
cd build
conan -s build_type=Debug --build=missing -s compiler.stdlib=libstdc++11 ..
# For alternative compiler configuration:
# conan -s build_type=Debug -s compiler.stdlib=libstdc++11 --build=missing \
#   -s compiler=gcc -s compiler.version=6 ..
#   OR
# Use Conan configurations (https://docs.conan.io/en/latest/getting_started.html#building-with-other-configurations)
# and specify with conan -pr PATH ..
cmake -Dexample-build_tests=ON \ 
    -DCMAKE_BUILD_TYPE=debug ..
# For alternative compiler:
# cmake -Dexample-build_tests=ON \
# -DCMAKE_BUILD_TYPE=RelWithDebInfo \
# -DCMAKE_C_COMPILER=gcc-6 \
# -DCMAKE_CXX_COMPILER=g++-6 \
# ..
make clangformat # to format your files
make -j4
ctest # run tests
```

### Options
Options can be defined with `cmake ... -DOPTION_KEY=OPTION_VALUE`

| Key | Possible Values | Effect |
|-----|-----------------|--------|
| `USE_GOLD_LINKER`     | `ON`/`OFF`    | Use GNU gold linker instead of ld. Only effect if gold is found.  |
| `INCREMENT_LINK`      | `ON`/`OFF`    | Use gold linker's `--incremental` flag to speed up relink speed. Effective only when `USE_GOLD_LINKER` is specified. Note that this may disable many security protections like relto or PIE. Only use this when working on *Really* large project. |
| `example-build_tests` | `ON`/`OFF`    | Build test or not                                         |
| `CMAKE_BUILD_TYPE`    | `Debug`/`Release`/`RelWithDebInfo`    | Build type    |

## Differences between `master` and v2
- v2 is based on Ubuntu 18.04
- v2 uses Conan instead of git submodule to manage dependencies
- v2 uses g++-6/7 and clang++-6, while master uses g++-4.9/5 and clang++-3.8
- v2 enforces minimal CMake version = 3.9, while master only enforces 3.1
- v2 includes clang-tidy as an enforced check
