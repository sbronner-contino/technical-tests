FROM golang:alpine

ENV GO111MODULE=on

WORKDIR /app

RUN apk update --no-cache && apk add git

ADD ./ /app

RUN go build -o golang-test  .

FROM alpine:latest

WORKDIR /app
COPY --from=0 /app/golang-test .

ENTRYPOINT ["/app/golang-test"]

EXPOSE 8000
