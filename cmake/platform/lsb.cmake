find_program(LSB_RELEASE_EXECUTABLE
  lsb_release)

if(LSB_RELEASE_EXECUTABLE)
  set(LSB_FOUND TRUE CACHE BOOL "lsb_release executable was found")
  execute_process(COMMAND ${LSB_RELEASE_EXECUTABLE} -si
    OUTPUT_VARIABLE LSB_DISTRIB_ID
    OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  string(TOUPPER ${LSB_DISTRIB_ID} v)
  set(${v} TRUE CACHE BOOL "LSB Distrib tag")

  execute_process(COMMAND ${LSB_RELEASE_EXECUTABLE} -sd
    OUTPUT_VARIABLE LSB_DESCRIPTION
    OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  execute_process(COMMAND ${LSB_RELEASE_EXECUTABLE} -sr
    OUTPUT_VARIABLE LSB_RELEASE
    OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  execute_process(COMMAND ${LSB_RELEASE_EXECUTABLE} -sc
    OUTPUT_VARIABLE LSB_CODENAME
    OUTPUT_STRIP_TRAILING_WHITESPACE
    )

  string(TOUPPER ${LSB_DISTRIB_ID} v)
  set(${v} TRUE CACHE BOOL "LSB Distribution")
  #message(STATUS "${v} is on.")

  string(TOUPPER ${LSB_DISTRIB_ID}_${LSB_CODENAME} v)
  set(${v} TRUE CACHE BOOL "LSB Distrib - codename tag")
  #message(STATUS "${v} is on.")
endif()
