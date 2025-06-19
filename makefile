# .make/vars

# ------------------------------
.PHONY: all build push debug clean

all: build push

## 1. cross‑compile 出 arm64 可除錯 binary
build:
	docker buildx build \
		--platform linux/arm64 \
		--target artifact \
		--output type=local,dest=./dist \
		-t hello-pi .

## 2. 把 binary 丟到 Pi
push:
	scp -p ./dist/hello pi@192.168.100.49:/home/pi/test/hello


