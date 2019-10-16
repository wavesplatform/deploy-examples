# Crawler stage
FROM wavesplatform/blockchain-postgres-sync as crawler

# Data-service stage
FROM wavesplatform/data-service as dataservice

# Result stage
FROM postgres:12-alpine
WORKDIR /app

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB blockchain

# Install common dependencies
RUN apk update && \
    apk add wget curl npm supervisor

# Setup postgres
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh && \
    ln -s /usr/local/bin/docker-entrypoint.sh /

ENV NODE_ENV production
ENV LOG_LEVEL info
ENV MIGRATE true
ENV DEFAULT_MATCHER MATCHER
ENV PGPOOLSIZE 20

# Setup crawler
COPY --from=crawler /opt/app ./crawler

# Setup dataservice
COPY --from=dataservice /opt/dataservice ./dataservice

# Waiting scripts for postgres
ADD scripts/wait-for-postgres.sh /wait-for-postgres.sh

# Setup supervisord
ADD supervisord.conf /etc/

CMD ["supervisord"]

EXPOSE 5432 3010


