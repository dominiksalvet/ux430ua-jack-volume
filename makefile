#-------------------------------------------------------------------------------
# Copyright 2018 Dominik Salvet
# SPDX-License-Identifier: MIT
# https://gitlab.com/dominiksalvet/ux430ua-jack-volume
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
MAKE_DIR := make
INSTALL_DIR := /usr/local/bin
BUILD_DIR := build

#-------------------------------------------------------------------------------
# HELP GENERATOR
#-------------------------------------------------------------------------------

# sed script - get automatically target descriptions from a makefile
define GET_TARGET_DESCRIPTIONS
/^[^:=#[:blank:]]+[[:blank:]]*:[^:=#]*#/!d
s/[:=#[:blank:]][^#]*//
s/[[:blank:]#]*#[[:blank:]#]*/#/g
s/^/  /
endef
export GET_TARGET_DESCRIPTIONS

# shows generated help of a given makefile from it's comments
define show_generated_help
	@$(ECHO) 'USAGE: make [TARGET]...'
	@$(ECHO)
	@$(ECHO) 'TARGET:'
	@$(SED) -E -e "$$GET_TARGET_DESCRIPTIONS" $(1) | $(COLUMN) -t -s '#'
endef

#-------------------------------------------------------------------------------
# TARGETS
#-------------------------------------------------------------------------------

.PHONY: all install uninstall install-deps deploy help

# there is no building required, so the default target references to the help target
all: help

install: install-deps deploy # install the entire project automatically

uninstall: # uninstall the project
	./$(MAKE_DIR)/uninstall '$(INSTALL_DIR)'

install-deps: # install dependencies of the project
	./$(MAKE_DIR)/install-deps

deploy: # deploy the project files
	./$(MAKE_DIR)/deploy '$(INSTALL_DIR)' '$(BUILD_DIR)'

help: # default, show this help
	$(call show_generated_help,makefile)
