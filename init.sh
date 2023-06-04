#!/bin/bash
docker-compose down
docker rmi springboot-docker-tianlin-sb:latest 
docker-compose up -d
