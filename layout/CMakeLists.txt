cmake_minimum_required(VERSION 3.5)

project(layout LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (MSVC)
    add_compile_options(/utf-8)
endif()

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

file(GLOB ROOT_HEADERS *.h)
file(GLOB ROOT_SOURCES *.cpp)
file(GLOB ROOT_RESOURCES *.qrc)
file(GLOB ROOT_UI *.ui)

source_group(layout FILES
  ${ROOT_HEADERS}
  ${ROOT_SOURCES}
  ${ROOT_RESOURCES}
  ${ROOT_UI}
)

add_executable(layout
  ${ROOT_HEADERS}
  ${ROOT_SOURCES}
  ${ROOT_RESOURCES}
  ${ROOT_UI}
)

target_compile_definitions(layout
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(layout PRIVATE
    Qt5::Core
    Qt5::Quick
)
