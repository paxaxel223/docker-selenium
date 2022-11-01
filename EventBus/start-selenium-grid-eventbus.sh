#!/usr/bin/env bash

# set -e: exit asap if a command exits with a non-zero status
set -e

echo "Starting Selenium Grid EventBus..."

if [ ! -z "$SE_EVENT_BUS_HOST" ]; then
  echo "Using SE_EVENT_BUS_HOST: ${SE_EVENT_BUS_HOST}"
  HOST_CONFIG="--host ${SE_EVENT_BUS_HOST}"
fi

if [ ! -z "$SE_EVENT_BUS_PORT" ]; then
  echo "Using SE_EVENT_BUS_PORT: ${SE_EVENT_BUS_PORT}"
  PORT_CONFIG="--port ${SE_EVENT_BUS_PORT}"
fi

if [ ! -z "$SE_OPTS" ]; then
  echo "Appending Selenium options: ${SE_OPTS}"
fi

EXTRA_LIBS="/opt/selenium/selenium-http-jdk-client.jar"

if [ ! -z "$SE_ENABLE_TRACING" ]; then
  EXTERNAL_JARS=$(</external_jars/.classpath.txt)
  EXTRA_LIBS=${EXTRA_LIBS}:${EXTERNAL_JARS}
  echo "Tracing is enabled"
  echo "Classpath will be enriched with these external jars : " ${EXTRA_LIBS}
else
  echo "Tracing is disabled"
fi

java ${JAVA_OPTS:-$SE_JAVA_OPTS} -Dwebdriver.http.factory=jdk-http-client \
  -jar /opt/selenium/selenium-server.jar \
  --ext ${EXTRA_LIBS} event-bus \
  --bind-host ${SE_BIND_HOST} \
  ${HOST_CONFIG} \
  ${PORT_CONFIG} \
  ${SE_OPTS}
