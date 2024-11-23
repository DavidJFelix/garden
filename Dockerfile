FROM node:22-slim@sha256:4b44c32c9f3118d60977d0dde5f758f63c4f9eac8ddee4275277239ec600950f AS builder
WORKDIR /usr/src/app
COPY package.json .
COPY package-lock.json* .
RUN npm ci

FROM node:22-slim@sha256:4b44c32c9f3118d60977d0dde5f758f63c4f9eac8ddee4275277239ec600950f
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ /usr/src/app/
COPY . .
CMD ["npx", "quartz", "build", "--serve"]
