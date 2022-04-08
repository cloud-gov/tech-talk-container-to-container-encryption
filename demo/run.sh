#!/bin/bash
source env.cfg

set -e

cf push $PROXY_APP_NAME -f ../proxy/manifest.yml -p ../proxy --var proxy_route=$BACKEND_APP_NAME.apps.internal

cf push $BACKEND_APP_NAME -f ../backend/manifest.yml -p ../backend

cf map-route $BACKEND_APP_NAME apps.internal --hostname $BACKEND_APP_NAME

cf add-network-policy $PROXY_APP_NAME $BACKEND_APP_NAME --protocol tcp --port 61443
