.PHONY: build

build:
	chmod u+x ./example/example.sh
	./example/example.sh 2> /dev/null

prerequisites: build

target: prerequisites
