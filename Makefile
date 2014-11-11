.DELETE_ON_ERROR:
export PATH := ./node_modules/.bin:$(PATH)

BUILD_DIR = ./dist
CONFIG_DIR = ./config
OL_DIR = ./node_modules/openlayers

CONFIGS := $(shell find $(CONFIG_DIR) -name '*.json')
BUILDS := $(patsubst $(CONFIG_DIR)/%.json,$(BUILD_DIR)/%.js,$(CONFIGS))

.PHONY: build-all
build-all: $(BUILDS) $(BUILD_DIR)/ol.css

$(BUILD_DIR)/%.js: $(CONFIG_DIR)/%.json node_modules/.install
	@mkdir -p $(BUILD_DIR)
	@node $(OL_DIR)/tasks/build.js $< $@

$(BUILD_DIR)/ol.css: node_modules/.install
	@mkdir -p $(BUILD_DIR)
	@cp $(OL_DIR)/css/ol.css $@

node_modules/.install: package.json
	@npm prune
	@npm install
	@npm dedupe
	@touch $@
