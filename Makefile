COMPOSE_FILE=docker-compose.yml

# .PHONY tell make that this is a target, not a file
.PHONY: up down restart logs status clean help

# Is called as "make help" or just "make"
help:
	@echo "Available commands:"
	@echo "  make up      - run qdrant in background"
	@echo "  make down    - stop and remove container"
	@echo "  make restart - restart"
	@echo "  make logs    - show realtime logs"
	@echo "  make status  - check container status"
	@echo "  make clean   - stop and remove all containers and its data"

up:
	docker compose -f $(COMPOSE_FILE) up -d

down:
	docker compose -f $(COMPOSE_FILE) down

restart:
	docker compose -f $(COMPOSE_FILE) restart

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

status:
	docker compose -f $(COMPOSE_FILE) ps

clean:
	@echo "Warning: This will delete all indexes in qdrant_storage!"
	docker compose -f $(COMPOSE_FILE) down -v