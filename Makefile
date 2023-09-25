# Define the name of the Docker image
IMAGE_NAME := duckdb-dev

run:
	docker run -ti $(IMAGE_NAME):master

# Run the query from echo first parameter
run-query:
	docker run -i $(IMAGE_NAME):master -s "$(DUCKDB_QUERY)"

shell:
	docker run -ti --entrypoint bash $(IMAGE_NAME):master	

builder:
	docker buildx create --name mybuilder --bootstrap --use	

build:
	docker buildx build --push \
	--platform linux/arm64/v8,linux/amd64 \
	--tag $(IMAGE_NAME):master .

	