.PHONY: clean build package

build: gomodgen
	env GOOS=linux GOARCH=arm64 go build -ldflags="-s -w" -tags lambda.norpc -o fetch/bootstrap fetch/main.go
	env GOOS=linux GOARCH=arm64 go build -ldflags="-s -w" -tags lambda.norpc -o serve/bootstrap serve/main.go

package: build
	mkdir -pv ./package
	zip package/fetch.zip --filesync --junk-paths fetch/bootstrap
	zip package/serve.zip --filesync --junk-paths serve/bootstrap

clean:
	rm -rf ./package/*zip
	rm -f ./fetch/bootstrap
	rm -f ./serve/bootstrap

deploy: clean build package
	serverless deploy --verbose

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh
