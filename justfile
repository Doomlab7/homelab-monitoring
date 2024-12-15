# List available recipes
default:
    @just --list

# Install required Ansible collections and roles
setup:
    ansible-galaxy collection install community.docker
    ansible-galaxy collection install community.general

# Check syntax of Ansible playbooks
lint:
    ansible-playbook site.yml --syntax-check

# Run Ansible in check mode (dry run)
check:
    ansible-playbook site.yml --check --diff

# Deploy the entire monitoring stack
deploy:
    ansible-playbook site.yml

# Deploy only logging components (Loki, Promtail, MinIO)
deploy-logging:
    ansible-playbook site.yml --tags logging

# Deploy only metrics collection (Netdata, Glances, Stats)
deploy-metrics:
    ansible-playbook site.yml --tags metrics

# Deploy only network monitoring (Speedtest, Wireshark)
deploy-network:
    ansible-playbook site.yml --tags network

# Stop all monitoring services
stop:
    ansible-playbook site.yml -e "monitoring.logging.enabled=false monitoring.metrics.enabled=false monitoring.network.enabled=false"

# View logs of a specific service (usage: just logs service=loki)
logs service:
    docker logs {{ service }} -f --tail 100

# Clean up old docker volumes and images
cleanup:
    docker system prune -f
    docker volume prune -f
