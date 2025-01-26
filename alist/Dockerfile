# ---- 构建镜像环境 ----
FROM alpine:edge AS builder

ARG VERSION="自编译版"

WORKDIR /app

RUN apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache bash curl gcc git go musl-dev

COPY ./ ./

RUN go mod download

RUN curl -L https://github.com/alist-org/web-dist/archive/refs/heads/dev.tar.gz -o dist-dev.tar.gz \
    && tar -zxvf dist-dev.tar.gz \
    && rm -rf public/dist \
    && mv -f web-dist-dev/dist public \
    && rm -rf dist-dev.tar.gz 

RUN export ldflags="\
    -X 'github.com/alist-org/alist/v3/internal/conf.BuiltAt=$(TZ=Asia/Shanghai date +'%F %T %z')' \
    -X 'github.com/alist-org/alist/v3/internal/conf.GoVersion=$(go version | sed 's/go version //')' \
    -X 'github.com/alist-org/alist/v3/internal/conf.GitCommit=默认' \
    -X 'github.com/alist-org/alist/v3/internal/conf.GitAuthor=xhofe' \
    -X 'github.com/alist-org/alist/v3/internal/conf.Version=${VERSION}' \
    -w -s" \ 
    && go build -o ./bin/alist -ldflags="$ldflags" -tags=jsoniter .

# ---- 生产环境 ----
FROM alpine:edge

ARG VERSION="自编译版"

LABEL MAINTAINER="admin@yangrucheng.top"
LABEL VERSION="${VERSION}"

WORKDIR /opt/alist/

RUN apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache bash ca-certificates su-exec tzdata \
    && rm -rf /var/cache/apk/*

COPY --from=builder /app/bin/alist ./

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /opt/alist/alist \
    && chmod +x /entrypoint.sh \
    && /entrypoint.sh version

ENV PUID=0 PGID=0 UMASK=022

VOLUME /opt/alist/data/

EXPOSE 5244

CMD [ "/entrypoint.sh" ]