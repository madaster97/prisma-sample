FROM node:lts-alpine3.17 as base

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci

# FROM base as production

# TODO: Add typescript and build

# ENV PORT 3000
# EXPOSE $PORT
# CMD [ "npm", "run", "start:migrate" ]