#!/bin/bash

docker build -t cron-sheduler .

docker run --rm -d --env-file=.env --name=cron-sheduler cron-sheduler
