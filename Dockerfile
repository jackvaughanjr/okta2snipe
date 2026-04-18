FROM golang:1.25-alpine AS builder
WORKDIR /src
COPY . .
RUN go build -o /app/okta2snipe .

FROM alpine:3.21
COPY --from=builder /app/okta2snipe /app/okta2snipe
ENTRYPOINT ["/app/okta2snipe"]
