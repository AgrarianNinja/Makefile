# Simple generic Makefile for Linux based C++ projects
# AgrarianNinja
# https://github.com/AgrarianNinja/Makefile

# Enter the name of your program here:
PROGRAM = your_program_name

# Specify compiler:
CXX = g++

# Compiler flags:
CXXFLAGS = -std=c++20 -ggdb -O2 -Wall -pedantic -Wextra
# Examples:
# -std=c++20 compile using this c++ version.
# -ggdb produces debugging information for GDB using most expressive format available.
# -O2 optimises compiled code, finds more errors. Use -O3 for production builds if need.
# -Wall shows all warnings.
# -pedantic issues all warnings demanded by strict ISO C++ rules if you want to be extra safe.
# -Wextra enables some extra warnings not turned on by -Wall.

# Preprocessor flags:
CPPFLAGS =

# Library flags for use by linker:
LDLIBS =
# Examples:
# -lz for zlib, http://zlib.net/

# Specify input and output directories, must include "/" at end of path, or leave blank:
SRCDIR = src/
OBJDIR = obj/
BINDIR = #bin/ # Uncomment if desired.

COMPILE:= $(CXX) $(CXXFLAGS) $(CPPFLAGS) -c

OBJFILES:= $(patsubst $(SRCDIR)%.cpp,$(OBJDIR)%.o,$(wildcard $(SRCDIR)*.cpp))

.PHONY: all clean show

all: $(BINDIR)$(PROGRAM)

$(BINDIR)$(PROGRAM): $(OBJFILES) | $(BINDIR)
	$(CXX) -o $(BINDIR)$(PROGRAM) $(OBJFILES) $(LDLIBS)

$(OBJDIR)%.o: $(SRCDIR)%.cpp | $(OBJDIR)
	$(COMPILE) -o $@ $<

$(OBJDIR):
	mkdir -p $@

$(BINDIR):
	mkdir -p $@

clean: 
	rm -v $(OBJDIR)*.o
	rm -v $(BINDIR)$(PROGRAM)

show:
	# For debug testing of Makefile.
	@echo 'TARGET :' $@
	@echo 'COMPILE :' $(COMPILE)
	@echo 'OBJFILES :' $(OBJFILES)
	@echo 'WILDCARD :' $(wildcard $(SRCDIR)*.cpp)
