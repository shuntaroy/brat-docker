FROM python:3.8

# FROM alpine:latest
# RUN apk update && apk add --no-cache git python3 mailcap

RUN git clone https://github.com/nlplab/brat 

WORKDIR /brat

RUN git reset --hard $COMMIT_SHA

COPY config.py ./

CMD ["python3", "standalone.py"]
