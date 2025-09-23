# Compiler
FPC = fpc

# Output directory
OUTDIR = bin

# Source files
SRC = src/test.pas

# Unit search paths
UNIT_PATHS = \
    -Fu"src/data-structures" \
    -Fu"src/benchmark" \
    -Fu"src/algorithms/bubblesort" \
    -Fu"src/algorithms/heapsort" \
    -Fu"src/algorithms/insertion-sort" \
    -Fu"src/algorithms/mergesort" \
    -Fu"src/algorithms/quicksort" \
    -Fu"src/algorithms/selection-sort"

# Compiler flags
FLAGS = -MDelphi -FE"$(OUTDIR)"

# Default target
all:
	$(FPC) $(SRC) $(FLAGS) $(UNIT_PATHS)

# Clean compiled files
clean:
	rm -f $(OUTDIR)/*.o $(OUTDIR)/*.ppu $(OUTDIR)/test

# Run the program
run: all
	./$(OUTDIR)/test