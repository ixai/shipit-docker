#!/bin/bash

cp -fr /etc/shipit-docker/config/* "${APP_HOME}/config/"

bundle exec rails assets:precompile
bundle exec rails s -p 3000 -b '0.0.0.0'