(
  cd "$(dirname "$0")"
  cd docker/compose
  docker-compose down
  docker-compose up -d $@
  docker-compose logs
  docker-compose ps
)
