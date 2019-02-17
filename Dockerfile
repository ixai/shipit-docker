FROM ruby:2.6.1

RUN apt-get update -qq && \
    apt-get install -y nodejs && \
    gem install rails -v 5.2

WORKDIR /var

ADD template.rb .

RUN rails _5.2_ new shipit \
    --skip-action-cable \
    --skip-turbolinks \
    --skip-action-mailer \
    --skip-active-storage \
    -m template.rb

ENV APP_HOME /var/shipit

WORKDIR $APP_HOME

RUN bundle install

CMD bundle exec rails s -p 3000 -b '0.0.0.0'
