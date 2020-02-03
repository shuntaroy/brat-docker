FROM alpine:latest

RUN apk update && apk add --no-cache curl python tar mailcap

# Fetch  brat
RUN curl -L https://github.com/nlplab/brat/archive/v1.3_Crunchy_Frog.tar.gz | tar xvz

WORKDIR /brat-1.3_Crunchy_Frog/

COPY config.py ./

RUN mkdir /data /work && ln -s /data . && ln -s /work .

EXPOSE 8001

CMD ["python", "/brat-1.3_Crunchy_Frog/standalone.py"]
