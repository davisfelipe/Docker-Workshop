FROM golang:1.14 as build

ENV APP_HOME /app
ENV GO111MODULE on

WORKDIR ${APP_HOME}

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY main.go .
COPY src src

RUN go build . \
    && chmod 755 simpleApp

FROM debian:stretch

RUN groupadd --gid 1000 app_node \
    && useradd --uid 1000 --gid app_node --shell /bin/bash --create-home app_node

ENV APP_HOME /app
ENV GIN_MODE release

WORKDIR ${APP_HOME}

COPY --from=build ${APP_HOME}/simpleApp ${APP_HOME}/simpleApp

USER app_node

CMD [ "./simpleApp" ]


