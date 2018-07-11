#-------------------------------------------------------------------------------
# Copyright (C) 2018 Dominik Salvet
# SPDX-License-Identifier: MIT
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
META_DIR := meta
SRC_DIR := src
INSTALL_DIR := /usr/local/bin

#-------------------------------------------------------------------------------
# HELP GENERATOR
#-------------------------------------------------------------------------------

# sed script for automatic target descriptions parsing
define GET_TARGET_DESCRIPTIONS
/^[a-zA-Z0-9]\+\s*:\([a-zA-Z0-9]\|\s\)*#.*$$/!d
s/^\([a-zA-Z0-9]\+\)[^#]*/\1/
s/\s*#\+\s*/#/g
s/^/  /
endef
export GET_TARGET_DESCRIPTIONS

# function that displays generated help
define display_generated_help
	@$(ECHO) 'Usage: make [TARGET]...'
	@$(ECHO)
	@$(ECHO) 'TARGET:'
	@$(SED) -e "$$GET_TARGET_DESCRIPTIONS" $(1) | $(COLUMN) -t -s '#'
endef

#-------------------------------------------------------------------------------
# TARGETS
#-------------------------------------------------------------------------------

.PHONY: all install uninstall help

# the default target
all: help

install: # install the program
	./$(SRC_DIR)/install '$(INSTALL_DIR)' '$(META_DIR)'

uninstall: # uninstall the program
	./$(SRC_DIR)/uninstall '$(INSTALL_DIR)'

help: # display this help
	$(call display_generated_help,makefile)
