# .make/vars

# ------------------------------
.PHONY: all build push debug clean

all: build push

build:
	docker buildx build \
		--platform linux/arm64 \
		--target artifact \
		--output type=local,dest=./dist \
		-t hello-pi .

push:
	scp -p ./dist/hello pi@192.168.100.49:/home/pi/test/hello


