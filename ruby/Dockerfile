FROM ruby

ENV APP_NAME=sample

# n packageでnodejsとnpmの管理をする
RUN apt-get update \
  && apt-get install -y mariadb-client nodejs npm \
  # && npm install n -g \ 
  # && n stable \
  # && apt-get purge -y nodejs npm \
  # && exec $SHELL -l \
  && npm install -g yarn \
  && gem install rails

WORKDIR /var/www/${APP_NAME}
