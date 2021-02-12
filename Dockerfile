# PHASE #1: CODE BUILDING[0]
FROM node:alpine
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# PHASE #2: DEPLOYMENT[1]
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html