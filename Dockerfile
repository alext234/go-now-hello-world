# build stage
FROM golang:alpine AS build-env
ADD . /src
RUN cd /src && go build -o hello-world

# final stage
FROM alpine
WORKDIR /app
COPY --from=build-env /src/hello-world /app/
ENTRYPOINT ./hello-world
EXPOSE 3000



