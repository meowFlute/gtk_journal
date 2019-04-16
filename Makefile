IDIR =./src
ODIR =./src/obj
SDIR =./src
CC=gcc
CFLAGS=-I$(IDIR) `pkg-config gtk+-3.0 --cflags`
LFLAGS=`pkg-config gtk+-3.0 --libs`

VER=1
REV=0.0

_DEPS = hello.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = 	hello.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

hello: $(OBJ)
	$(CC) -o $@ $< $(LFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(IDIR)/*~
