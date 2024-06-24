FROM golang AS builder

WORKDIR /app

COPY ./hello.go .

RUN go mod init hello && \
    go build .

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello .

ENTRYPOINT [ "./hello" ]

