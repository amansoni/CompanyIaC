
# Pure Node/Vite dev setup
FROM node:20-alpine
WORKDIR /app
COPY package.json package-lock.json ./
ENV NODE_ENV=development
RUN echo "NODE_ENV=$NODE_ENV" && rm -rf node_modules && npm install
COPY . .
EXPOSE 8000
CMD ["npm", "run", "dev"]
