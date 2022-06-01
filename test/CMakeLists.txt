cmake_minimum_required(VERSION 2.8.5)
set(PROJECT_NAME test)
project(${PROJECT_NAME} C CXX)

#向当前工程添加存放源文件的子目录，并可以指定中间二进制和目标二进制的存放位置
#当执行cmake时，就会进入src目录下去找src目录下的CMakeLists.txt
add_subdirectory(test_cJson)
add_subdirectory(test_hiredis)
add_subdirectory(test_string)
add_subdirectory(test_mysql)
