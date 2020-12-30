FROM golang:1.14 as build

ENV APP_HOME /app
ENV GO111MODULE on

WORKDIR ${APP_HOME}

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY main.go .
COPY src src

RUN go build .

FROM ubuntu

ENV APP_HOME /app
ENV GIN_MODE release

WORKDIR ${APP_HOME}

COPY --from=build ${APP_HOME}/simpleApp ${APP_HOME}/simpleApp

CMD [ "./simpleApp" ]
