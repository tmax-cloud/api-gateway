IMAGE_DIR=_images
TRAEFIK_NAME=traefik/traefik
TRAEFIK_TAG=v2.5.3
CONSOLE_NAME=tmaxcloudck/hypercloud-console
CONSOLE_TAG=5.0.34.0
JWT_NAME=tmaxcloudck/jwt-decde
JWT_TAG=5.0.0.0
PULL=podman pull
SAVE=podman save

prepare_online:
	sudo $(PULL) $(TRAEFIK_NAME):$(TRAEFIK_TAG)
	sudo $(SAVE) $(TRAEFIK_NAME):$(TRAEFIK_TAG) > $(TRAEFIK_NAME):$(TRAEFIK_TAG).tar
	sudo $(PULL) $(CONSOLE_NAME):$(CONSOLE_TAG)
	sudo $(SAVE) $(CONSOLE_NAME):$(CONSOLE_TAG) > $(CONSOLE_NAME):$(CONSOLE_TAG).tar
	sudo $(PULL) $(JWT_NAME):$(JWT_TAG)
	sudo $(SAVE) $(JWT_NAME):$(JWT_TAG) > $(JWT_NAME):$(JWT_TAG).tar

#prepare_offline:
	#sudo podman save $(JWT_NAME):$(JWT_TAG) > $(JWT_NAME):$(JWT_TAG).tar