# -------- builder --------
ARG GO_VERSION=1.23
FROM --platform=$BUILDPLATFORM golang:${GO_VERSION} AS builder

WORKDIR /src
COPY go.mod ./
RUN go mod download

COPY . .

RUN --mount=type=cache,target=/root/.cache/go-build \
    go build -gcflags="all=-N -l" \
             -ldflags="-compressdwarf=false" \
             -o /out/hello .

# -------- artifact --------
FROM scratch AS artifact
COPY --from=builder /out/hello /hello
