# ---- 构建环境 ----
FROM docker.io/library/alpine:edge AS builder

WORKDIR /app/

RUN apk add --no-cache bash curl jq gcc git go musl-dev

COPY ./ ./

RUN go get

RUN go build -o /app/bin/openlist

# ---- 生产环境 ----
FROM alpine:edge

LABEL MAINTAINER="OpenList"

WORKDIR /opt/openlist/

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache bash ca-certificates su-exec tzdata && \
    rm -rf /var/cache/apk/*

COPY --chmod=755 --from=builder /app/bin/openlist ./

COPY --chmod=755 entrypoint.sh /entrypoint.sh

RUN /entrypoint.sh version

ENV PUID=0 PGID=0 UMASK=022

VOLUME /opt/openlist/data/

EXPOSE 5244 5245

CMD [ "/entrypoint.sh" ]
