.DEFAULT_GOAL := help

FILE_TARGETS := edit decrypt encrypt

ifneq ($(filter $(FILE_TARGETS),$(MAKECMDGOALS)),)
ifndef FILE
$(error FILE is required. Example: make edit FILE=atuin/.env)
endif
endif

ifneq ($(findstring .enc.,$(FILE)),)
ENC_FILE := $(FILE)
DEC_FILE := $(subst .enc.,.,$(FILE))
else
DEC_FILE := $(FILE)
ENC_FILE := $(basename $(FILE)).enc$(suffix $(FILE))
endif

.PHONY: help edit decrypt encrypt

help:
	@printf '%s\n' \
		'Usage:' \
		'  make edit FILE=atuin/.env' \
		'  make decrypt FILE=atuin/.env' \
		'  make encrypt FILE=atuin/.env'

edit:
	EDITOR="code -w" sops edit $(ENC_FILE)

decrypt:
	sops decrypt --output $(DEC_FILE) $(ENC_FILE)

encrypt:
	sops encrypt --output $(ENC_FILE) $(DEC_FILE)
