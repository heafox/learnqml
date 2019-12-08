cmake_minimum_required(VERSION 3.5)

project(textfield)

#set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

#option(BUILD_SHARED_LIBS "Enable build of shared libraries" ON)

link_directories(${LIBRARY_OUTPUT_PATH})

add_subdirectory(src)
add_subdirectory(tools)
add_subdirectory(tests)
add_subdirectory(examples)
