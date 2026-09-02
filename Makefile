.PHONY: build

build:
	chmod u+x ./example/example.sh
	./example/example.sh

prerequisites: build

target: prerequisites
