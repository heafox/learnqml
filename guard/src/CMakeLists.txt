cmake_minimum_required(VERSION 3.5)

project(guard LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

file(GLOB_RECURSE CURRENT_HEADERS *.h *.hpp)
source_group("Include" FILES ${CURRENT_HEADERS})

file(GLOB_RECURSE CURRENT_SOURCES *.c *.cpp)
source_group("Sources" FILES ${CURRENT_SOURCES})

file(GLOB_RECURSE CURRENT_UI *.ui)
source_group("Ui" FILES ${CURRENT_UI})

file(GLOB_RECURSE CURRENT_RESOURCES *.qrc)
source_group("Resources" FILES ${CURRENT_RESOURCES})

if(ANDROID)
    add_library(guard SHARED
        ${CURRENT_HEADERS}
        ${CURRENT_SOURCES}
        ${CURRENT_UI}
        ${CURRENT_RESOURCES}
        )
else()
    add_executable(guard
        ${CURRENT_HEADERS}
        ${CURRENT_SOURCES}
        ${CURRENT_UI}
        ${CURRENT_RESOURCES}
        )
endif()

target_compile_definitions(guard
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(guard
  PRIVATE
  Qt5::Core
  Qt5::Quick
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
