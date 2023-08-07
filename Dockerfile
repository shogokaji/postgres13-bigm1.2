FROM postgres:13
COPY pg_bigm-1.2-20200228.tar.gz /pg_bigm-1.2-20200228.tar.gz
RUN apt-get update \
  && apt-get install -y make gcc postgresql-server-dev-13 libicu-dev \
  && tar zxfv pg_bigm-1.2-20200228.tar.gz \
  && cd pg_bigm-1.2-20200228 \
  && make USE_PGXS=1 PG_CONFIG=`which pg_config` \
  && make USE_PGXS=1 PG_CONFIG=`which pg_config` install