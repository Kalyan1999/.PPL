# Docker Container for PPL Course

## Langages Included
  * Ada
  * C
  * C# (C-Sharp)
  * C++
  * COBOL
  * Fortran
  * Go
  * Haskell
  * Java
  * LISP
  * Lua
  * Obj-C
  * Perl
  * PHP
  * Prolog
  * Python3
  * Racket (previously PLT Scheme)
  * Ruby
  * Swift
  * Smalltalk

## Requirements

  1. Docker Desktop.
  
  2. At least 6GB of free storage on Drive.
  
  3. A Good Internet Connection or LOTS of Patience.

## Installation
  
  1. Go-To [Docker Website](https://www.docker.com/products/docker-desktop), download and install docker for your platform

  2. Clone this Repo
     
     * Click the Download in the Upper right-hand corner

     * Or use this command
       ```
       git clone https://github.com/SaiHemanthBR/.PPL.git
       ```
  
  3. Build the Container
     ```
     docker build -t PPL .
     ```

## Instructions

  To Run the Container:

  * Linux or MacOS users, 
    ```
    docker run -it --rm --privileged -h PPL --name PPL -v "$(pwd)"/workspace:/home/ubuntu/workspace PPL
    ```
  
  * Windows users,
    ```
    docker run -it --rm --privileged -h PPL --name PPL -v "%cd%"/workspace:/home/ubuntu/workspace PPL
    ```
