#!/bin/bash

# Function to check disk usage
disk_usage() {
  echo "Disk Usage:"
  df -h
}

# Function to check memory usage
memory_usage() {
  echo "Memory Usage:"
  free -h
}

# Function to check CPU load
cpu_load() {
  echo "CPU Load:"
  uptime
}

# Function to check network statistics
network_stats() {
  echo "Network Statistics:"
  netstat -i
}

# Function to log results
log_results() {
  echo "System Monitoring Summary" > logs/system_summary.log
  echo "-------------------------" >> logs/system_summary.log

  echo "Disk Usage:" >> logs/system_summary.log
  disk_usage >> logs/system_summary.log

  echo "" >> logs/system_summary.log
  echo "Memory Usage:" >> logs/system_summary.log
  memory_usage >> logs/system_summary.log

  echo "" >> logs/system_summary.log
  echo "CPU Load:" >> logs/system_summary.log
  cpu_load >> logs/system_summary.log

  echo "" >> logs/system_summary.log
  echo "Network Statistics:" >> logs/system_summary.log
  network_stats >> logs/system_summary.log

  echo "Logs have been saved to logs/system_summary.log"
}

# Create necessary directories
mkdir -p logs

# Run monitoring functions and log results
disk_usage > logs/disk_usage.log
memory_usage > logs/memory_usage.log
cpu_load > logs/cpu_load.log
network_stats > logs/network_stats.log
log_results

# Display the consolidated log
cat logs/system_summary.log
