FROM node:26-alpine3.23 AS base

WORKDIR /app

RUN apk add curl bash --no-cache
RUN curl -sf https://gobinaries.com/tj/node-prune | sh

#----------------BUILD-----------------
FROM base AS builder
COPY ./src ./src
COPY package*.json ./

RUN npm install
RUN npm prune --omit=dev && node-prune

#----------------RELEASE-----------------
FROM node:26-alpine3.23 AS release

RUN apk add dumb-init --no-cache 


WORKDIR /app 

USER node

COPY --chown=node:node --from=builder /app/ ./

ARG APP_ENV
ENV APP_ENV=${APP_ENV}

EXPOSE 3000

CMD ["dumb-init", "node", "src/main.js"]