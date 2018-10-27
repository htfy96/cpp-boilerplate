# cpp-boilerplate
A modern boilerplate for C++ project, built on Cmake, Catch and spdlog

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
```
mkdir -p build
cd build
cmake -Dexample-build_tests=ON \ 
    -DCMAKE_BUILD_TYPE=debug ..
make clangformat # to format your files
make -j4
ctest # run tests
```

## Differences between `master` and v2
- v2 is based on Ubuntu 18.04
- v2 uses g++-6/7 and clang++-6, while master uses g++-4.9/5 and clang++-3.8
- v2 enforces minimal CMake version = 3.9, while master only enforces 3.1
- v2 includes clang-tidy as an enforced check
