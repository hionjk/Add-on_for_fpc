# Add on for fpc compiler
This bash script makes it easy to compile and run pascal code.
The fpc compiler creates but does not delete an object file after compilation. This script solves this problem, and also gives you a convenient structure divided into two folders **code** and **executable**. The first contains your source files, the second contains the executable files.

# Preparing
Create next structure 
```
├── pascal/              # Main directory
    ├── code/            # source files
    ├── executable/      # executable files
```
Download the sfpc.sh from this repository and place it in the created inside your main directory. Now main directory should look like this:
```
├── pascal/              # Main directory
    ├── sfpc.sh          # Bash script
    ├── code/            # source files
    ├── executable/      # executable files
```

Now, let's make our script executable! You can do this with the following command:

`chmod +x sfpc.sh`

Done

# First Run
Let's create a hello world program

`./sfpc.sh cr hello_world`

The script will create a `hello_world.pas` file in `code/` directory and write a standard .pas file template there
```
  program hello_world; <- program name is hello_world because we named our file hello_world.
  begin
    writeln('Hello world!')
  end.
```

Now, let's compile our `hello_world.pas` file

`./sfpc co hello_world`

The script will compile the file, place it in the `executable/` directory, automatically execute it, and also delete the object file, which for some reason fpc does not delete
