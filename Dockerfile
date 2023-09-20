FROM node:lts-alpine3.17 as base

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci

FROM base as builder
COPY tsconfig.json ./tsconfig.json
# build won't have mounts
COPY server ./server
COPY prisma ./prisma
RUN npx prisma generate && npm run build

FROM node:lts-alpine3.17 as production
WORKDIR /usr/src/app
ENV NODE_ENV production
COPY --from=builder /usr/src/app/dist ./dist
# Need to copy Prisma before running generate
COPY prisma ./prisma
COPY package.json package-lock.json ./
# Installing prisma will NOT run generate
RUN npm ci && npx prisma generate