SHELL := /bin/bash
LIBDIR := Libs
PACKAGER_URL := https://raw.githubusercontent.com/BigWigsMods/packager/master/release.sh
SCHEMA_URL := https://raw.githubusercontent.com/Meorawr/wow-ui-schema/main/UI.xsd

.PHONY: check dist libs
.FORCE:

all: check data

check:
	@luacheck -q $(shell git ls-files '*.lua')
	@xmllint --schema <(curl -s $(SCHEMA_URL)) --noout $(shell git ls-files '*.xml')

dist:
	@curl -s $(PACKAGER_URL) | bash -s -- -d -l

libs:
	@curl -s $(PACKAGER_URL) | bash -s -- -c -d -z
	@mkdir -p Libs/
	@cp -a .release/LibDBCompartment/Libs/* Libs/
