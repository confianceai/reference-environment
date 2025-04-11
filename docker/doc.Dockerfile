FROM node:lts-alpine as build

WORKDIR /app
COPY ./ ./
RUN npm ci \
    --prefer-offline \
    --pure-lockfile \
    --non-interactive \
    && npm run build

FROM node:lts-alpine
WORKDIR /app
RUN npm install -g http-server@14.1.1 nodemon@3.1.9
COPY --from=build /app/build .

EXPOSE 3000
CMD ["nodemon", "--exec", "http-server", "--port", "3000", "--host", "0.0.0.0"]
