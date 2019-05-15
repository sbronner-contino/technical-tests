FROM golang:alpine3.9

ENV GO111MODULE=on

WORKDIR /app

RUN apk update --no-cache && apk add git

ADD ./ /app

RUN go build -o golang-test  .

FROM alpine:3.9.4

WORKDIR /app
COPY --from=0 /app/golang-test .

ENTRYPOINT ["/app/golang-test"]

EXPOSE 8000
