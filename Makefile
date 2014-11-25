CC = gcc
CFLAGS = -c -O2 -Wall
LDFLAGS = -ludev
SRCS = sas_path_id.c
OBJS = $(SRCS:.c=.o)
EXEC = sas_path_id
DESTDIR ?=

all: $(SOURCES) $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

%.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f *.o $(EXEC) 

install:
	mkdir -p $(DESTDIR)/lib/udev/rules.d
	install -m 755 $(EXEC) $(DESTDIR)/lib/udev
	install -m 644 61-sas-storage.rules $(DESTDIR)/lib/udev/rules.d
