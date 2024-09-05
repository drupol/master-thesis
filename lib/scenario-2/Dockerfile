FROM alpine@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b AS build-env
RUN apk add --no-cache build-base
WORKDIR /app
COPY . .
RUN gcc datetime.c -o datetime

FROM alpine@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b
COPY --from=build-env /app/datetime /app/datetime
WORKDIR /app
CMD ["/app/datetime"]
