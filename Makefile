.PHONY: build

build:
	cd example && chmod u+x example.sh && ./example.sh

prerequisites: build

target: prerequisites
