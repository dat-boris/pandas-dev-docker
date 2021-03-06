IMAGE_NAME=borisdachinaman/pandas_dev
CONTAINER_NAME=pandas_dev_container

build:
	docker build -t $(IMAGE_NAME) .

rm:
	docker rm -f $(CONTAINER_NAME) || true

run: rm
	docker run -it --name $(CONTAINER_NAME) --volume `pwd`/pandas:/pandas $(IMAGE_NAME) /bin/bash

exec:
	docker exec -i -t $(CONTAINER_NAME) /bin/bash

# Maintaince
pull:
	docker push $(IMAGE_NAME)

push:
	docker push $(IMAGE_NAME)
