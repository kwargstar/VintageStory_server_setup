# Download files
FROM ubuntu:latest AS builder

ARG RELEASE_TYPE="stable"
ARG VERSION="1.21.5"

WORKDIR /server

ADD "https://cdn.vintagestory.at/gamefiles/${RELEASE_TYPE}/vs_server_linux-x64_${VERSION}.tar.gz" /tmp/vs_server.tar.gz
RUN tar xzf "/tmp/vs_server.tar.gz" -C "/server" &&\
    rm "/tmp/vs_server.tar.gz"

# Run server
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS base
VOLUME [ "/server/data" ]

WORKDIR /server
COPY --from=builder /server /server

RUN chmod +x ./VintagestoryServer

EXPOSE 42420/tcp
CMD ./VintagestoryServer --dataPath /server/data
