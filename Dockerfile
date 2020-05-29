FROM golang:1.14 as builder
WORKDIR /
ADD . .
RUN make build

FROM alpine:3.11
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=builder /json_exporter /bin/json_exporter

CMD "/bin/json_exporter"
