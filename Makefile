GOLDFLAGS=-s -w -extldflags '-zrelro -znow'

.PHONY: all
all: dist/arm64/mauzr dist/amd64/mauzr

.PHONY: dist/arm64/mauzr
dist/arm64/mauzr:
	GOARCH=arm64 go build -trimpath -ldflags "$(GOLDFLAGS)" -o $@ ./cmd/mauzr

.PHONY: dist/amd64/mauzr
dist/amd64/mauzr:
	GOARCH=amd64 go build -trimpath -ldflags "$(GOLDFLAGS)" -o $@ ./cmd/mauzr

.PHONY: benchmark
benchmark:
	go test -bench=. ./...

.PHONY: test
test:
	go test -race ./...

.PHONY: vet
vet:
	go vet ./...
