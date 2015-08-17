set(THIRD_PARTY_LIBS
  alleg
  alut
  openal
  z
  ${CPPUNIT_LIBRARIES}
)
if(NOT MSVC)
  list(APPEND THIRD_PARTY_LIBS m)
endif()

if(DEFINED ELKULATOR_LINK_X11)
  set(PLATFORM_THIRD_PARTY_LIBS
    X11
    Xcursor
    Xpm
    Xxf86vm
  )
else()
  set(PLATFORM_THIRD_PARTY_LIBS)
endif()
