# delve-image

How to build:

```bash
GO_VERSION=1.24.4
DLV_VERSION=1.24.2
ALPINE_VERSION=3.22

# docker buildx create --name multi-arch
docker buildx --builder multi-arch build \
  --platform linux/amd64,linux/arm64 \
  -t ghcr.io/cbarbian-sap/delve:$DLV_VERSION \
  --push \
  --build-arg GO_VERSION=$GO_VERSION \
  --build-arg DLV_VERSION=$DLV_VERSION \
  --build-arg ALPINE_VERSION=$ALPINE_VERSION \
  .
```
