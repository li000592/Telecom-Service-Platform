#!/bin/bash

echo "🚀 Starting Telecom Service Platform..."

# Check prerequisites
echo "📋 Checking prerequisites..."
command -v java >/dev/null 2>&1 || { echo "❌ Java 17 is required but not installed. Aborting." >&2; exit 1; }
command -v mvn >/dev/null 2>&1 || { echo "❌ Maven is required but not installed. Aborting." >&2; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "❌ Docker is required but not installed. Aborting." >&2; exit 1; }

echo "✅ Prerequisites check passed!"

# Start infrastructure
echo "🐳 Starting infrastructure services..."
docker-compose up -d postgres redis kafka zookeeper

# Wait for services
echo "⏳ Waiting for services to be ready (30 seconds)..."
sleep 30

# Build project
echo "🔨 Building project..."
mvn clean package -DskipTests

# Start device service
echo "🚀 Starting device service..."
cd device-service
mvn spring-boot:run -Dspring-boot.run.profiles=dev &

# Wait for service to start
echo "⏳ Waiting for service to start (30 seconds)..."
sleep 30

echo "✅ Service is ready!"
echo "📖 API Documentation: http://localhost:8081/device-service/swagger-ui.html"
echo "💚 Health Check: http://localhost:8081/device-service/actuator/health"
echo "📊 Metrics: http://localhost:8081/device-service/actuator/prometheus"

echo "🎉 Telecom Service Platform is running!"
