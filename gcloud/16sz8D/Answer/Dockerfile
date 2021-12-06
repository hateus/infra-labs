FROM node:16.13.0 as build
WORKDIR /app

COPY package*.json /app/
RUN npm ci --production


FROM node:16.13.0-slim as runtime
WORKDIR /app

COPY --from=build /app/ /app/
COPY . /app/

RUN groupadd -r app \
    && useradd -m -r -g app app \
    && apt-get update \
    && apt-get install -y gosu \
    && rm -rf /var/lib/apt/lists/* \
    && gosu nobody true

ENTRYPOINT ["/app/docker-entrypoint.sh"]
