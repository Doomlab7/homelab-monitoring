# 🏠 Homelab Monitoring Stack

A comprehensive monitoring solution for homelab infrastructure using Prometheus, Grafana, and various exporters. This stack provides detailed insights into system performance, container metrics, and network statistics. 📊

> This is duplicated in my homelab-compose repo but I keep this here for public access

## ✨ Features

- **System Monitoring** 🖥️
  - CPU utilization (user, system, I/O wait)
  - Memory usage and swap
  - Disk I/O and usage
  - Network traffic (per interface)

- **Container Monitoring** 🐳
  - Container CPU usage
  - Container memory usage
  - Container network I/O
  - Container disk usage

- **Network Monitoring** 🌐
  - Internet speed monitoring (download/upload)
  - Network interface statistics
  - Network traffic analysis via Wireshark

## 🧩 Components

- **Prometheus**: Time series database for metrics storage 📝
- **Grafana**: Visualization and dashboarding 📈
- **Node Exporter**: System metrics collection 🔍
- **cAdvisor**: Container metrics collection 🐋
- **Speedtest Exporter**: Internet speed monitoring 🚀
- **Wireshark**: Network traffic analysis 🔎
- **SMART Monitoring**: Disk health monitoring 💾

## 📋 Prerequisites

- Docker and Docker Compose
- Linux-based system
- Sufficient disk space for metrics storage
- Root/sudo access for container privileges

## 📸 Screenshot

![image](https://github.com/user-attachments/assets/600e1ed8-d012-4537-8295-1743a1da32da)


## 🚀 Quick Start

1. Clone the repository:
```bash
git clone https://github.com/Doomlab7/homelab-monitoring.git
cd homelab-monitoring
```

2. Configure environment variables:
```bash
cp .env.example .env
# Edit .env with your specific configurations
```

3. Start the monitoring stack:

`docker compuse up -d`

4. Access Grafana:
- Open `http://localhost:3000` in your browser (or your chosen port)
- Default credentials are in your `.env` file 🔑

## 📊 Dashboard Overview

The monitoring stack comes with a pre-configured dashboard that includes:

1. **System Metrics** 🖥️
   - CPU utilization broken down by type (user, system, I/O wait)
   - Memory usage with swap monitoring
   - Disk I/O per device
   - Network traffic per interface

2. **Container Metrics** 🐳
   - Resource usage per container
   - Network I/O per container
   - Container status monitoring

3. **Network Monitoring** 🌐
   - Internet speed tracking (scraped every hour - configured in ./config/prometheus/prometheus.yml)
   - Network interface statistics
   - Detailed traffic analysis

## ⚙️ Configuration

### Prometheus

- Configuration file: `config/prometheus/prometheus.yml`
- Scrape intervals and targets can be modified here
- Job configurations for all exporters

### Grafana

- Dashboards: `config/grafana/dashboards/`
- Data sources: `config/grafana/provisioning/datasources/`
- Dashboard provisioning: `config/grafana/provisioning/dashboards/`

## 🛠️ Maintenance

- Metrics data is persisted in Docker volumes
- Regular backups of the Prometheus and Grafana volumes are recommended
- Monitor disk usage of the metrics volume

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests.

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details
