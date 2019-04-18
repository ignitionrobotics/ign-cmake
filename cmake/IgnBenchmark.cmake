#.rst
# IgnBenchmark
# ------------
#
# ign_add_version_info_target()
#
# Adds a target to generate build and system configuration information.
#
#===============================================================================
# Copyright (C) 2019 Open Source Robotics Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

function(ign_add_version_info_target)
  # generate a version_info.json file that can be used to embed project
  # version information
  # While this command may look a bit unweildy, it creates a target
  # that forces the file to be regenerated at build time.
  add_custom_target(version_info_target
    COMMAND ${CMAKE_COMMAND}
      -Dinput_file=${IGNITION_CMAKE_DIR}/version_info.json.in
      -Doutput_file=${PROJECT_BINARY_DIR}/version_info.json
      -Drepository_root=${CMAKE_CURRENT_SOURCE_DIR}
      # Yes, these variables need to be passed in, because they won't
      # get properly set when invoked as a CMake script.
      -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
      -DPROJECT_VERSION=${PROJECT_VERSION}
      -DPROJECT_VERSION_FULL=${PROJECT_VERSION_FULL}
      -DPROJECT_VERSION_MAJOR=${PROJECT_VERSION_MAJOR}
      -DPROJECT_VERSION_MINOR=${PROJECT_VERSION_MINOR}
      -DPROJECT_VERSION_PATCH=${PROJECT_VERSION_PATCH}
      -DPROJECT_NAME=${PROJECT_NAME}
      -P ${IGNITION_CMAKE_DIR}/IgnGenerateVersionInfo.cmake
  )
endfunction()
