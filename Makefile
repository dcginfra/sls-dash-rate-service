.PHONY: build clean deploy gomodgen

build: gomodgen
	env GOOS=linux GOARCH=arm64 go build -ldflags="-s -w" -tags lambda.norpc -o fetch/bootstrap fetch/main.go
	env GOOS=linux GOARCH=arm64 go build -ldflags="-s -w" -tags lambda.norpc -o serve/bootstrap serve/main.go

clean:
	rm -rf ./bin

deploy: clean build
	serverless deploy --verbose

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh
