.PHONY: build clean deploy gomodgen

build: gomodgen
	env GOOS=linux go build -ldflags="-s -w" -o bin/fetch fetch/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/serve serve/main.go

clean:
	rm -rf ./bin

deploy: clean build
	serverless deploy --verbose

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh
