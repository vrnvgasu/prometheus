FROM golang:1.21.6-alpine3.19 as builder
WORKDIR /app
COPY go.mod go.sum ./
COPY main.go ./
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o simple-app .

FROM alpine:3.19.1
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/simple-app ./
CMD ["/root/simple-app"]