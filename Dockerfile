FROM ruby:2.4

RUN apt-get update
RUN apt-get install -y mongodb-server 
RUN gem install bundler
COPY ./reddit /reddit

COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh

RUN cd /reddit && bundle install
RUN chmod 0777 /start.sh

CMD ["/start.sh"]