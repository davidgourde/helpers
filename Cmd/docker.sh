# Docker command line helpers

# To build and push a docker image to the GCR repo setup in the .env
# This can be used to deploy a version of something local, that isn't tagged/pushed yet by a pipeline
docker-compose build && docker-compose push
