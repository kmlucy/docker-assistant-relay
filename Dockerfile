FROM node:8-alpine
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

COPY assistant-relay /assistant-relay/
WORKDIR /assistant-relay

RUN apk add --no-cache tzdata

VOLUME /assistant-relay/server/configurations/secrets
VOLUME /assistant-relay/server/configurations/tokens
EXPOSE 3000

CMD ["npm","run","start"]
