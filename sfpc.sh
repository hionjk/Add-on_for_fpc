error() {
  echo -e "Error: $1";
  exit $2;
}

SOURCE_CODE_DIRECTORY="./code";
EXECUTABLE_FILES_DIRECTORY='./executable';

if [ $# -le 1 ]; then
  error "arguments are not enough" 1
fi

init() {
  mkdir $SOURCE_CODE_DIRECTORY
  mkdir $EXECUTABLE_FILES_DIRECTORY;
  echo "Initializing: success";
}

compile() {
  echo "Compilating $1.pas ..."

  if [ ! -d "$EXECUTABLE_FILES_DIRECTORY" ]; then 
    error "Directory $EXECUTABLE_FILES_DIRECTORY doesn't exist; Execute: ./sfpc.sh init
"
  fi

  if [ $1 == *.pas ]; then
    error "Enter the file name without suffix" 2
  fi

  if [ ! -f "$SOURCE_CODE_DIRECTORY/$1.pas" ]; then
    error "File $1.pas does not exist" 4
  fi

  fpc -o$EXECUTABLE_FILES_DIRECTORY/$1 $SOURCE_CODE_DIRECTORY/$1.pas
  rm $EXECUTABLE_FILES_DIRECTORY/$1.o
  echo 
  ./$EXECUTABLE_FILES_DIRECTORY/$1;
  if [ $? -ne 0 ]; then
    error "an error occurred during compilation" 6
  fi

  echo; 
}

create() {
  echo "Creating: $1.pas ..."

  if [ ! -d "$SOURCE_CODE_DIRECTORY" ]; then 
    error "Directory $SOURCE_CODE_DIRECTORY doesn't exist; Execute: ./sfpc.sh init or just create   "
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

if [ $1 != 'init' ]; then
  if [ $# -ne 2 ]; then
    error "arguments are not enough" 1
  fi
fi

if [ $1 = 'co' ]; then
  compile $2
elif [ $1 = 'cr' ]; then
  create $2
elif [ $1 = 'init' ]; then
  init
fi
