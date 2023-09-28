# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -static

# Source, objects, and binary
SRCDIR = src
OBJDIR = obj
BINDIR = bin
DLLDIR = dll

SRC = $(wildcard $(SRCDIR)/*.cpp)
OBJ = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SRC))
BIN = $(BINDIR)/program

# Targets
all: directories $(BIN)

$(BIN): $(OBJ)
	$(CXX) $(OBJ) -o $(BIN)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: directories clean

directories:
	mkdir -p $(OBJDIR) $(BINDIR)

clean:
	rm -rf $(OBJDIR) $(BINDIR)

linux: all

windows: CXX=x86_64-w64-mingw32-g++
windows: all copydll

copydll:
	cp -a $(DLLDIR)/. $(BINDIR)
