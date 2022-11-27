# Docker Challenge

## Build Image APP

Arguments allows `development` and `production`
```
docker build -t CHANGEME:v1.0.0  -f docker/Dockerfile . --build-arg ENV=production
```


## Docker-compose

```
docker-compose up -d
```