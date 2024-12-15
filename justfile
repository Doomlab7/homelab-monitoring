# List available recipes
default:
    @just --list

# Start the complete monitoring stack
up: up-logging up-metrics up-network

# Start only logging stack (Loki, Promtail, MinIO)
up-logging:
    docker compose --profile logging up -d

# Start only metrics stack (Prometheus, Grafana, Telegraf, SmartCTL)
up-metrics:
    docker compose --profile metrics up -d

# Start only network monitoring (Speedtest, Wireshark)
up-network:
    docker compose --profile network up -d

# Stop only logging stack (Loki, Promtail, MinIO)
down-logging:
    docker compose --profile logging down

# Stoponly metrics stack (Prometheus, Grafana, Telegraf, SmartCTL)
down-metrics:
    docker compose --profile metrics down

# Stop only network monitoring (Speedtest, Wireshark)
down-network:
    docker compose --profile network down

# Stop all stacks
down: down-logging down-metrics down-network

# View logs of a specific service (usage: just logs service=loki)
logs service:
    docker logs {{ service }} -f --tail 100

# Clean up old docker volumes and images
cleanup:
    docker system prune -f
    docker volume prune -f
