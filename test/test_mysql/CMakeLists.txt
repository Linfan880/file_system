cmake_minimum_required(VERSION 2.8.5)
set(PROJECT_NAME test_mysql)
project(${PROJECT_NAME} C CXX)

set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")

aux_source_directory("." TEST_MYSQL_SRC)

add_executable(${PROJECT_NAME} ${TEST_MYSQL_SRC})


target_link_libraries(${PROJECT_NAME} mysqlclient)