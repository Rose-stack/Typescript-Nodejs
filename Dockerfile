#Stage One: Build
FROM node:19-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

#Stage Two: Final
FROM node:19-alpine AS Final
WORKDIR /app
COPY --from=builder ./app/build ./build
COPY package*.json ./
RUN npm install --production
CMD npm start