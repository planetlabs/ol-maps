.DELETE_ON_ERROR:
export PATH := ./node_modules/.bin:$(PATH)

CONFIG_DIR = ./config
OL_DIR = ./node_modules/openlayers

CONFIGS := $(shell find $(CONFIG_DIR) -name '*.json')
BUILDS := $(patsubst $(CONFIG_DIR)/%.json,%.js,$(CONFIGS))

.PHONY: build-all
build-all: $(BUILDS) ol.css

%.js: $(CONFIG_DIR)/%.json node_modules/.install
	@echo "Building $@"
	@node $(OL_DIR)/tasks/build.js $< $@

ol.css: node_modules/.install
	@cp $(OL_DIR)/css/ol.css $@

node_modules/.install: package.json
	@npm prune
	@npm install
	@touch $@
