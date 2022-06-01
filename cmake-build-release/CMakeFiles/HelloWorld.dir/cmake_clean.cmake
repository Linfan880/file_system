FILE(REMOVE_RECURSE
  "CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o"
  "CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o"
  "CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o"
  "CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o"
  "../bin/HelloWorld.pdb"
  "../bin/HelloWorld"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/HelloWorld.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
