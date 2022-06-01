cmake_minimum_required(VERSION 2.8.5)
set(PROJECT_NAME src_cgi)
project(${PROJECT_NAME} C CXX)

add_subdirectory(login)
add_subdirectory(register)
add_subdirectory(uoload)
add_subdirectory(myfiles)
add_subdirectory(md5)

