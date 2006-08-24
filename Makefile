CC=cc
OBJECTS=qthread
LINK_OBJECTS=main.o qthread.o redblack.o

#CFLAGS=-g -D__MAKECONTEXT_V2_SOURCE
CFLAGS=-O3 -g -D__MAKECONTEXT_V2_SOURCE
LINKFLAGS=-lpthread

.SUFFIXES:.c .cc .o .l .y

.c.o:	
	$(CC) $(CFLAGS) -c $*.c

.cc.o:	
	$(CC) $(CFLAGS) -c $*.cc

.y.c:
	$(YACC) -d -o $*.c $*.y

.l.c:
	$(LEX) -o$*.c $*.l

all: $(OBJECTS)
	@echo "---------------------------------------------------------------"
	@echo "Build finished."
	@echo "---------------------------------------------------------------"

clean:
	@echo "---------------------------------------------------------------"
	@echo "Removing old object files and other trash."
	@echo "---------------------------------------------------------------"
	rm -f $(OBJECTS)
	rm -f *.o
	rm -f #*#
	rm -f *~
	rm -f parser.c grammar.c grammar.output grammar.h

qthread: $(LINK_OBJECTS)
	$(CC) -o qthread $(LINK_OBJECTS) $(LINKFLAGS)

main.o: main.c qthread.h

qthread.o: qthread.c qthread.h redblack.h

redblack.o: redblack.c redblack.h
