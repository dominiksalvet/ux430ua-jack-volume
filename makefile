#-------------------------------------------------------------------------------
# Copyright (C) 2018 Dominik Salvet
# SPDX-License-Identifier: MIT
# <https://gitlab.com/dominiksalvet/ux430ua-jack-volume>
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# DEFINITIONS
#-------------------------------------------------------------------------------

# environment configuration
SHELL := /bin/sh
ECHO := echo
SED := sed
COLUMN := column

# directory definitions
SRC_DIR := src
INSTALL_DIR := /usr/local/bin

# sed script of automatic help generation from target comments
define HELP_GENERATOR
/^[a-zA-Z]\+:[a-zA-Z ]*#.*$$/!d
s/^\s*/  /
s/\s*:[^#]*//
s/#\+\s*/#/
s/#/<U+0023>/2g
endef
export HELP_GENERATOR


#-------------------------------------------------------------------------------
# TARGETS
#-------------------------------------------------------------------------------

.PHONY: all install uninstall help about

# the default target
all: help

install: # launch an installation wizard
	./$(SRC_DIR)/install.sh $(INSTALL_DIR)

uninstall: # launch an uninstallation wizard
	./$(SRC_DIR)/uninstall.sh $(INSTALL_DIR)

help: # display this help
	@$(ECHO) 'Usage: make [TARGET]...'
	@$(ECHO)
	@$(ECHO) 'TARGET:'
	@$(SED) -e "$$HELP_GENERATOR" makefile | $(COLUMN) -t -s '#'

about: # display information
	@$(ECHO) 'ux430ua-jack-volume 1.0.0'
	@$(ECHO) 'Fix low 3.5 mm jack output audio volume of ASUS ZenBook UX430UA on Linux.'
	@$(ECHO)
	@$(ECHO) 'Copyright (C) 2017-2018 Dominik Salvet'
	@$(ECHO) 'SPDX-License-Identifier: MIT'
	@$(ECHO) '<https://gitlab.com/dominiksalvet/ux430ua-jack-volume>'
