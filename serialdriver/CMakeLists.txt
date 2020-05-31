cmake_minimum_required(VERSION 3.5)

project(serialdriver LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (MSVC)
    add_compile_options(/utf-8)
endif()

file(GLOB_RECURSE CURRENT_HEADERS *.h *.hpp)
source_group("Header Files" FILES ${CURRENT_HEADERS})

file(GLOB_RECURSE CURRENT_SOURCES *.c *.cpp)
source_group("Source Files" FILES ${CURRENT_SOURCES})

file(GLOB_RECURSE CURRENT_UI *.ui)
source_group("Ui Files" FILES ${CURRENT_UI})

file(GLOB_RECURSE CURRENT_RESOURCES *.qrc)
source_group("Resource Files" FILES ${CURRENT_RESOURCES})

find_package(Qt5 COMPONENTS Core Quick SerialPort REQUIRED)

if(ANDROID)
    add_library(serialdriver SHARED
        ${CURRENT_HEADERS}
        ${CURRENT_SOURCES}
        ${CURRENT_UI}
        ${CURRENT_RESOURCES}
    )
else()
    add_executable(serialdriver
        ${CURRENT_HEADERS}
        ${CURRENT_SOURCES}
        ${CURRENT_UI}
        ${CURRENT_RESOURCES}
    )
endif()

target_compile_definitions(serialdriver
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(serialdriver PRIVATE
    Qt5::Core
    Qt5::Quick
    Qt5::SerialPort
)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# These variables must use CACHE, otherwise QtCreator won't see them.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android" CACHE INTERNAL "")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so CACHE INTERNAL "")
#    endif()
#endif()
