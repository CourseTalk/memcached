FROM ubuntu:14.04

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r memcache && useradd -r -g memcache memcache

RUN apt-get update && apt-get install -y memcached

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER memcache
EXPOSE 11211
CMD ["memcached"]
