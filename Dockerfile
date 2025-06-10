ARG TARGETOS
ARG TARGETARCH
ARG GO_VERSION=1.24.4
ARG ALPINE_VERSION=3.22


FROM --platform=$BUILDPLATFORM golang:$GO_VERSION AS builder

ARG DLV_VERSION=1.24.2

WORKDIR /go

RUN git clone https://github.com/go-delve/delve && cd delve && git checkout v$DLV_VERSION && CGO_ENABLED=0 GOOS=${TARGETOS:-linux} GOARCH=${TARGETARCH} go build -o dlv ./cmd/dlv


FROM --platform=$BUILDPLATFORM alpine:$ALPINE_VERSION

LABEL org.opencontainers.image.source=https://github.com/cbarbian-sap/delve-image

COPY --from=builder /go/delve/dlv /bin/dlv

ENTRYPOINT ["/bin/sh"]
