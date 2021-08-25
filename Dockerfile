ARG TZ

ARG POSTGRES_VERSION

FROM postgres:${POSTGRES_VERSION}

ENV TZ=${TZ:-Europe/Moscow}

RUN apt-get update && apt-get install postgis* -y && rm -rf /var/lib/apt/lists/*

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8

ENV LANG ru_RU.utf8

COPY create_second_db.sh /docker-entrypoint-initdb.d/

RUN chmod +x /docker-entrypoint-initdb.d/create_second_db.sh

USER postgres
