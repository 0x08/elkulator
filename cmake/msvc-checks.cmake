# We need reasonable C++11 support
if (MSVC_VERSION LESS 1800)
  message(FATAL_ERROR "Version ${MSVC_VERSION} of Visual C++ compiler at ${CMAKE_CXX_COMPILER} not supported")
endif()
