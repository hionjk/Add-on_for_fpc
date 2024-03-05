# Add on for fpc compiler
This bash script makes it easy to compile and run pascal code.
The fpc compiler creates but does not delete an object file after compilation. This script solves this problem, and also gives you a convenient structure divided into two folders **code** and **executable**. The first contains your source files, the second contains the executable files.

# Preparing
First you need to create the main directory where the script and other directories will be.

Then download sfpc.sh from this repository and place it in your main directory. The main directory should now look like this:
```
├── pascal/              # Main directory
    ├── sfpc.sh          # Bash script
```
Now, let's make our script executable! You can do this with the following command:

`chmod +x sfpc.sh`

Almost finished, all that remains is to make 2 directories: `code` and `executable`. You can create them yourself, or execute: 

`./sfpc.sh init`

The correct structure should look like this:
```
├── pascal/              # Main directory
    ├── sfpc.sh          # Bash script
    ├── code/            # Source files
    ├── executable/      # Executable files
```


# First Run
Let's create a hello world program!

First, create the hello_world.pas file:

`./sfpc.sh cr hello_world`

cr - means **cr**eate, <br/>hello_world - name of the source file *Since sfpc only works with Pascal code, you don't need to add a suffix to filename.*

The script will create a `hello_world.pas` file in `code/` directory and write a standard .pas file template there
```
  program hello_world; <- program name is hello_world because we named our file hello_world.
  begin
    writeln('Hello world!')
  end.
```

Now, let's compile our `hello_world.pas` file

`./sfpc co hello_world`

co - means **co**mpile, <br/>hello_world - name of the source file

The script will compile the file, place it in the `executable/` directory, automatically execute it, and also delete the object file, which for some reason fpc does not delete
