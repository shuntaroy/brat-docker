FROM alpine:latest

RUN apk update && apk add --no-cache curl python tar

# Fetch  brat
RUN curl http://weaver.nlplab.org/~brat/releases/brat-v1.3_Crunchy_Frog.tar.gz | tar xvz

WORKDIR brat-v1.3_Crunchy_Frog/

COPY config.py ./

RUN mkdir /data /work /cfg
RUN ln -s /data . && ln -s /work .

EXPOSE 8001

CMD ["python", "/brat-v1.3_Crunchy_Frog/standalone.py"]
