FROM node:20-slim@sha256:a0196893dffad1f1a5723a8c817b45681402be549a8f196bf9c93a5bc30628e3 AS builder
WORKDIR /usr/src/app
COPY package.json .
COPY package-lock.json* .
RUN npm ci

FROM node:20-slim@sha256:a0196893dffad1f1a5723a8c817b45681402be549a8f196bf9c93a5bc30628e3
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ /usr/src/app/
COPY . .
CMD ["npx", "quartz", "build", "--serve"]
