PREFIX  = /usr/local
LIBDIR  = $(PREFIX)/lib/lua/5.1
CFLAGS  = -O2 -Wall -fPIC
LDFLAGS = -shared
LDLIBS  = -lsass

sass.so: lsass.o
	$(CC) $(LDFLAGS) $(LDLIBS) -o $@ $<

install: sass.so
	install -Dpm0755 $< $(DESTDIR)$(LIBDIR)/$<

uninstall:
	rm -f $(DESTDIR)$(LIBDIR)/sass.so

test: sass.so
	@lua test.lua
	@echo "All tests passed"

clean:
	rm -f sass.so lsass.o


.PHONY: install uninstall test clean