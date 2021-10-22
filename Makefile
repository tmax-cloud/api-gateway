IMAGE_DIR=_images
# docker.io & quay.io & etc..
REGISTRY=docker.io
OFFREGISTRY=192.169.1.150
TRAEFIK_NAME=library/traefik
TRAEFIK_TAG=v2.5.3
CONSOLE_NAME=tmaxcloudck/hypercloud-console
CONSOLE_TAG=5.0.34.0
JWT_NAME=tmaxcloudck/jwt-decde
JWT_TAG=5.0.0.0
PULL=podman pull
SAVE=podman save

prepare_online:
	sudo $(PULL) $(REGISTRY)/$(TRAEFIK_NAME):$(TRAEFIK_TAG)
	sudo $(SAVE) $(REGISTRY)/$(TRAEFIK_NAME):$(TRAEFIK_TAG) > $(IMAGE_DIC)/traefik_$(TRAEFIK_TAG).tar
	sudo $(PULL) $(REGISTRY)/$(CONSOLE_NAME):$(CONSOLE_TAG)
	sudo $(SAVE) $(REGISTRY)/$(CONSOLE_NAME):$(CONSOLE_TAG) > $(IMAGE_DIC)/console_$(CONSOLE_TAG).tar
	sudo $(PULL) $(REGISTRY)/$(JWT_NAME):$(JWT_TAG)
	sudo $(SAVE) $(REGISTRY)/$(JWT_NAME):$(JWT_TAG) > $(IMAGE_DIC)/jwt-decode_$(JWT_TAG).tar

#prepare_offline:
	#sudo podman save $(JWT_NAME):$(JWT_TAG) > $(JWT_NAME):$(JWT_TAG).tar