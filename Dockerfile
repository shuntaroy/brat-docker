FROM alpine:latest

# set users cfg file
ARG USERS_CFG=users.json

RUN apk update && apk add --no-cache curl apache2 python py-pip tar

# Fetch  brat
RUN curl http://weaver.nlplab.org/~brat/releases/brat-v1.3_Crunchy_Frog.tar.gz | tar xvz

WORKDIR brat-v1.3_Crunchy_Frog/

COPY config.py user_patch.py users.json .

RUN python user_patch.py

RUN mkdir data work

VOLUME data
VOLUME work

EXPOSE 8001

CMD ["python", "/brat-v1.3_Crunchy_Frog/standalone.py"]
