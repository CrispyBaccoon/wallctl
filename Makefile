PREFIX ?= ${HOME}/.local

all: wallctl

wallctl:
	@printf '%s\n\n' '#!/bin/sh -e' >wallctl
	@for i in src/* ; do cat $$i ; echo ; done >>wallctl
	@echo 'main "$$@"' >>wallctl

clean:
	@-rm wallctl

install: wallctl
	@echo installing wallctl to ${PREFIX}/bin/wallctl
	@install -D -m 0755 wallctl ${PREFIX}/bin/wallctl

.PHONY: all
