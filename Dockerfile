FROM alpine:latest
COPY entrypoint.sh /bin/entrypoint.sh
EXPOSE	80
ENTRYPOINT ["/bin/entrypoint.sh"]
