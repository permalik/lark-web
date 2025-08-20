FROM node:22.18-alpine AS builder
RUN npm install -g pnpm

WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm build

FROM node:22.18-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
EXPOSE 5173
RUN npm install -g serve
CMD ["serve", "-s", "dist", "-l", "5173"]
