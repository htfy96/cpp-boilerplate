# cpp-boilerplate
A modern boilerplate for C++ project, built on Cmake, Catch and spdlog

[![Travis](https://img.shields.io/travis/htfy96/cpp-boilerplate.svg?style=flat-square)](https://travis-ci.org/htfy96/cpp-boilerplate)
[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![license](https://img.shields.io/github/license/htfy96/cpp-boilerplate.svg?style=flat-square)](https://github.com/htfy96/cpp-boilerplate/blob/master/LICENSE)


## Test matrix

| Distribution | Compiler | `CMAKE_BUILD_TYPE` |  Status  |
|--------------|----------|--------------------|----------|
| Ubuntu 14.04 | `g++-4.9`| `Debug`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/master/1) |
| Ubuntu 14.04 | `g++-4.9`| `Release`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/master/2) |
| Ubuntu 14.04 | `g++-5`| `Debug`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/master/3) |
| Ubuntu 14.04 | `g++-5`| `Release`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/master/4) |
| Ubuntu 14.04 | `clang++-3.8`| `Debug`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/master/5) |
| Ubuntu 14.04 | `clang++-3.8`| `Release`             | ![Status](https://travis-matrix-badges.herokuapp.com/repos/htfy96/cpp-boilerplate/branches/master/6) |

## How to use this

1. Download this project: `git clone --recursive https://github.com/htfy96/cpp-boilerplate.git`
2. Change `example` in filenames/namespaces under `src/`, `test/` into `your_project`
3. Change `CMakeLists.txt`: `example` -> `your_project`
4. Change `.travis.yml`: `example` -> `your_project`
5. Change `README.md`: `cpp-boilerplate` -> `your_project`
6. Enable Travis-CI at https://travis-ci.org
7. Push & Enjoy it!
