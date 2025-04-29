#!/bin/bash

SERVICES=(
    "serviceRegistry"
    "questionService"
    "quizService"
    "userService"
)

BASE_DIR=$(pwd)
PIDS=()

# Function to stop all services
stop_services() {
    echo "Stopping all services..."
    for PID in "${PIDS[@]}"; do
        if kill -0 "$PID" 2>/dev/null; then
            kill "$PID"
            echo "Stopped process with PID $PID."
        fi
    done
    echo "All services stopped."
    exit 0
}

# Trap Ctrl+C (SIGINT) to stop services
trap stop_services SIGINT

# Start each service
for SERVICE in "${SERVICES[@]}"; do
    SERVICE_DIR="$BASE_DIR/$SERVICE"
    if [ -d "$SERVICE_DIR" ]; then
        echo "Starting $SERVICE..."
        (
            cd "$SERVICE_DIR" || exit
            mvn spring-boot:run &
            PIDS+=($!) # Capture the PID of the background process
        )
    else
        echo "Directory $SERVICE_DIR does not exist. Skipping $SERVICE."
    fi
done


# Wait for all background processes to finish
wait