FROM alpine:3.12
ADD prometheus_bot /
RUN apk add --no-cache ca-certificates tzdata tini
USER nobody
EXPOSE 9087
ENTRYPOINT ["/prometheus_bot"]
