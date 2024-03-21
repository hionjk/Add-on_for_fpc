#!/bin/bash

error() {
  echo -e "Error: $1";
  exit $2;
}

SOURCE_CODE_DIRECTORY="./code";
EXECUTABLE_FILES_DIRECTORY='./executable';
TESTS_DIRECTORY='./tests';

if [ $# -le 1 ]; then
  error "Invalid number of arguments" 1
fi

init() {
  mkdir $SOURCE_CODE_DIRECTORY
  mkdir $EXECUTABLE_FILES_DIRECTORY;
  mkdir $TESTS_DIRECTORY;
  echo "Initializing: success";
}

compile() {
  clear;
  echo "Compilling $1.pas ..."

  if [ ! -d "$EXECUTABLE_FILES_DIRECTORY" ]; then 
    error "Directory $EXECUTABLE_FILES_DIRECTORY doesn't exist; Execute: ./sfpc.sh init
"
  fi

  if [ $1 = *.pas ]; then
    error "Enter the file name without suffix" 2
  fi

  if [ ! -f "$SOURCE_CODE_DIRECTORY/$1.pas" ]; then
    error "File $1.pas does not exist" 4
  fi

  fpc -o$EXECUTABLE_FILES_DIRECTORY/$1 $SOURCE_CODE_DIRECTORY/$1.pas
  
  if [ ! -f "$EXECUTABLE_FILES_DIRECTORY/$1.o" ]; then
    error "an error occurred during compilation" 6
  fi  
  
  rm $EXECUTABLE_FILES_DIRECTORY/$1.o
  echo
  
   if [ $? -ne 0 ]; then
    error "an error occurred during compilation" 6
  fi

  echo; 
}

create() {
  echo "Creating: $1.pas ..."

  if [ ! -d "$SOURCE_CODE_DIRECTORY" ]; then 
    error "Directory $SOURCE_CODE_DIRECTORY doesn't exist; Execute: ./sfpc.sh init or just create it" 4
  fi

  if [ -f "$SOURCE_CODE_DIRECTORY/$1.pas" ]; then
    error "File $1.pas already exist" 3
  fi

  touch $SOURCE_CODE_DIRECTORY/$1.pas


  echo  "program $1;

begin
  writeln('Hello world!');
end." >> $SOURCE_CODE_DIRECTORY/$1.pas 

  echo "Creating: file $1.pas created successfully "
  
}

if [ $1 = 'co' ]; then
  if [ $# -ne 2 ]; then
    error "Invalid number of arguments" 1
  fi
  compile $2
elif [ $1 = 'cr' ]; then
  if [ $# -ne 2 ]; then
    error "Invalid number of arguments" 1
  fi
  create $2
elif [ $1 = 'init' ]; then
  init
fi
