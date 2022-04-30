# Makefile Template
<https://github.com/AgrarianNinja/Makefile>
## Description

Simple generic Makefile for Linux based C++ projects. This is the Makefile template I use at the start of my C++ projects, please modify to suit your purposes.

### Features
* Automatically finds and compiles all *.cpp source files within the source directory.
* Provides for different source, object and binary directories if desired.
* Creates object and binary directories if specified and they don't already exist.

### Usage
* Copy the Makefile to your project's root directory (or other desired location such as the source directory)
* Update the following variables as required:
```
PROGRAM
CXXFLAGS
CPPFLAGS
LDLIBS
SRCDIR
OBJDIR
BINDIR
```
* Type `make` to start building your project

### Assumptions
* Uses GNU Make.
* Source files have .cpp extension and have required header files in same directory.
* Does NOT account for LDFLAGS, if I ever use I will add in.
* Default configurations are set to my personal preference, adjust as you like :sunglasses:
