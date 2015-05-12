#
# @file configure_boost_env.cmake
#
# @breif Configure environment for Boost, to instruct the importing.
#
# BOOST_ROOT must be defined to be the root path of Boost.
# If BOOST_LIBRARYDIR is not defined, then ${BOOST_ROOT}/lib32-msvc-10.0 would
# be used in WIN32 platform.
#
# @note Default to use static and multi-threaded libs. If this is not desired,
# reset proper vars according to the 'FindBoost.cmake' file before
# importing/finding Boost packages.
#
macro(configure_boost_env)
    if(NOT BOOST_ROOT)
        set(BOOST_ROOT "$ENV{BOOST_ROOT}")
        set(BOOST_LIBRARYDIR "$ENV{BOOST_LIBRARYDIR}")
    endif()
    if(WIN32 AND NOT BOOST_ROOT)
        message(WARNING "BOOST_ROOT and BOOST_LIBRARYDIR needed on Windows")
    endif()
    if(WIN32 AND BOOST_ROOT AND NOT BOOST_LIBRARYDIR)
        set(BOOST_LIBRARYDIR "${BOOST_ROOT}/lib32-msvc-10.0")
    endif()
    set(Boost_DEBUG OFF)
    set(Boost_USE_STATIC_LIBS ON)
    set(Boost_USE_MULTITHREADED ON)
    set(Boost_USE_STATIC_RUNTIME OFF)
endmacro()
