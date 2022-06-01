cmake_minimum_required(VERSION 2.8.5)
set(PROJECT_NAME cloud_disk)
project(${PROJECT_NAME} C CXX)

set(CMAKE_CXX_STANDARD 11)

#可以⽤来向⼯程添加多个特定的头⽂件搜索路径，路径之间⽤空格分割
include_directories(include/thirdparty)
include_directories(include/disk)
include_directories(include)
#include_directories(include/thirdparty/cJson)
#include_directories(include/thirdparty/hiredis)
#include_directories(include/thirdparty/mysql)

#add_compile_options(-std=c++11 -Wall)

# 指定lib目录
link_directories(${PROJECT_SOURCE_DIR}/lib)

add_subdirectory(test)
add_subdirectory(src_cgi)

message("proj src dir is ${PROJECT_SOURCE_DIR}")
message("cmake bin dir is ${CMAKE_BINARY_DIR}")

#EXECUTABLE_OUTPUT_PATH ：目标二进制可执行文件的存放位置
#PROJECT_SOURCE_DIR：工程的根目录
set(EXECUTABLE_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/bin")
#set(EXECUTABLE_OUTPUT_PATH bin)
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

#aux_source_directory(thirdparty/cJson CJSON_SRC_LIST)
#add_library(cjson SHARED ${CJSON_SRC_LIST})
#set_target_properties(cjson_shared PROPERTIES OUTPUT_NAME "cjson")

#aux_source_directory(thirdparty/hiredis HIREDIS_SRC_LIST)
#add_library(hiredis SHARED ${HIREDIS_SRC_LIST})

#aux_source_directory(thirdparty/mysql MYSQL_SRC_LIST)
#add_library(mysqlclient SHARED ${MYSQL_SRC_LIST})
##set_target_properties(mysqlclient PROPERTIES OUTPUT_NAME "mysql")
