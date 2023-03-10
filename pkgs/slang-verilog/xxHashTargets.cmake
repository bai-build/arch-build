# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6...3.19)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget xxHash::xxhash xxHash::xxhsum)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Create imported target xxHash::xxhash
add_library(xxHash::xxhash SHARED IMPORTED)

set_target_properties(xxHash::xxhash PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "XXH_EXPORT"
  INTERFACE_INCLUDE_DIRECTORIES "/usr/include"
)

# Create imported target xxHash::xxhsum
add_executable(xxHash::xxhsum IMPORTED)

# Import target "xxHash::xxhash" for configuration "Release"
set_property(TARGET xxHash::xxhash APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(xxHash::xxhash PROPERTIES
  IMPORTED_LOCATION_RELEASE "/usr/lib/libxxhash.so.0.8.1"
  IMPORTED_SONAME_RELEASE "libxxhash.so.0"
  )

# Import target "xxHash::xxhsum" for configuration "Release"
set_property(TARGET xxHash::xxhsum APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(xxHash::xxhsum PROPERTIES
  IMPORTED_LOCATION_RELEASE "/usr/lib/libxxhsum.so.0.8.1"
  )

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
