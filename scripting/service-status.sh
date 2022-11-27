#!/bin/bash

SERVICE_NAME=$1
SERVICE_STATUS=$(systemctl is-active $SERVICE_NAME)

if [ "$SERVICE_STATUS" == "active" ]; then
  echo "The $SERVICE_NAME service is active"
else
  echo "The $SERVICE_NAME srevice is inactive or not exists"
fi
