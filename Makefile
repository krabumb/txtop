# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall

# Source, objects, and binary
SRCDIR = src
OBJDIR = obj
BINDIR = bin

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
