#!/bin/bash

cp -fr /etc/shipit-docker/config/* "${APP_HOME}/config/"

bundle exec sidekiq -C config/sidekiq.yml