cmake_minimum_required(VERSION 3.10.2 FATAL_ERROR)
project(ignition-component_deps VERSION 0.1.0)
find_package(ignition-cmake2 REQUIRED)
ign_configure_project()
ign_configure_build(QUIT_IF_BUILD_ERRORS
  COMPONENTS child parent)
ign_create_packages()
ign_create_docs()
