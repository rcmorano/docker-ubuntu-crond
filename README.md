# Run

```
docker run -it \
  -e CRON_STRING='*/2 * * * * nobody curl -s ifconfig.co' \
  rcmorano/ubuntu-crond:latest
```
