run-app:
	@echo "Running the app..."
	@docker compose up -d
	@docker compose ps

stop-app:
	@echo "Stopping the app..."
	@docker compose down

run-monitoring:
	@echo "Running the monitoring..."
	@docker compose -f docker-compose.monitoring.yaml up -d
	@docker compose -f docker-compose.monitoring.yaml ps

stop-monitoring: 
	@echo "Stopping the monitoring..."
	@docker compose -f docker-compose.monitoring.yaml down

run-all: run-app run-monitoring

stop-all: stop-monitoring stop-app
