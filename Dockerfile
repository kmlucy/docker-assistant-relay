FROM node:8-alpine
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apk add --no-cache git tzdata && \
	git clone https://github.com/greghesp/assistant-relay.git && \
	cd assistant-relay && \
	git checkout master && \
	npm install && \
	apk del git

VOLUME /assistant-relay/server/configurations/secrets
VOLUME /assistant-relay/server/configurations/tokens
EXPOSE 3000

WORKDIR /assistant-relay
CMD npm run start
