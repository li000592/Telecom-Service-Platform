.PHONY: build test run docker-build docker-run clean

# Variables
SERVICE_NAME = device-service
IMAGE_NAME = telecom-platform/$(SERVICE_NAME)
VERSION = latest

# Build the project
build:
	@echo "Building $(SERVICE_NAME)..."
	mvn clean package -DskipTests

# Run tests
test:
	@echo "Running tests for $(SERVICE_NAME)..."
	mvn test

# Run with Docker Compose
docker-run:
	@echo "Starting services with Docker Compose..."
	docker-compose up -d

# Stop Docker Compose
docker-stop:
	@echo "Stopping services..."
	docker-compose down

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	mvn clean

# Run locally
run:
	@echo "Running $(SERVICE_NAME) locally..."
	cd $(SERVICE_NAME) && mvn spring-boot:run -Dspring-boot.run.profiles=dev

# Help
help:
	@echo "Available commands:"
	@echo "  build          - Build the project"
	@echo "  test           - Run unit tests"
	@echo "  docker-run     - Start services with Docker Compose"
	@echo "  docker-stop    - Stop Docker Compose services"
	@echo "  run            - Run service locally"
	@echo "  clean          - Clean build artifacts"
