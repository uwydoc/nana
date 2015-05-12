cmake_minimum_required(VERSION 2.8)

project(nana_test)

# Nana specific
option(NANA_UNICODE "Whether enable unicode support or not" ON)
if(NANA_UNICODE)
    add_definitions(-DNANA_UNICODE)
endif()

option(NANA_ENABLE_PNG "Enable the use of PNG" ON)
if(NANA_ENABLE_PNG)
    add_definitions(-DNANA_ENABLE_PNG)

    option(NANA_LIBPNG "Use the included libpng" ON)
    if(NANA_LIBPNG)
        add_definitions(-DNANA_LIBPNG)
    else()
        find_package(PNG)
        if (PNG_FOUND)
            include_directories( ${PNG_INCLUDE_DIRS})
        endif()
    endif()
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall")
endif()

if(WIN32)
    include(${CMAKE_CURRENT_LIST_DIR}/../win32/configure_boost_env.cmake)
    configure_boost_env()
    find_package(Boost 1.41.0 REQUIRED
        COMPONENTS system)
    include_directories(${Boost_INCLUDE_DIRS})
endif()


# Custom
option(NANA_INSTALL_DIR "Path where nana is installed"
    "${CMAKE_CURRENT_LIST_DIR}/install")
if(NANA_INSTALL_DIR)
    include_directories(${NANA_INSTALL_DIR}/include)
    link_directories(${NANA_INSTALL_DIR}/lib)
endif()

add_executable(button button.cpp)
target_link_libraries(button
    nana gdi32 comdlg32
)
if(WIN32)
    target_link_libraries(button ${Boost_LIBRARIES})
endif()
