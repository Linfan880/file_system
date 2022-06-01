cmake_minimum_required(VERSION 2.8.5)
set(PROJECT_NAME login_cgi_src)
project(${PROJECT_NAME} C CXX)

set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")

aux_source_directory("." LOGIN_CGI_SRC)
aux_source_directory("../../include/disk/." INCLUDE_DISK_SRC)

add_executable(${PROJECT_NAME} ${LOGIN_CGI_SRC} ${INCLUDE_DISK_SRC})

target_link_libraries(${PROJECT_NAME} mysqlclient cjson hiredis fcgi)