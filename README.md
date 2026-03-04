# Bash Scripts

A collection of useful bash utility scripts for system administration and log management.

## Projects

### 1. [Log Archive Tool](Log-Archive-Tool/)

A bash script that compresses and archives log directories with timestamps.

**Features:**
- Timestamped archive file naming (YYYYMMDD_HHMMSS format)
- Gzip compression for efficient storage
- Error handling and validation
- Safe execution with bash strict mode

**Quick Start:**
```bash
cd Log-Archive-Tool
./log-archive.sh /path/to/logs
```

For more details, see [Log-Archive-Tool/README.md](Log-Archive-Tool/README.md)

---

### 2. [Server Performance Stats](Server-Performance-Stats/)

A lightweight bash script for monitoring Linux server performance metrics in real-time.

**Features:**
- CPU usage monitoring
- Memory consumption tracking
- Disk usage statistics
- Process monitoring (top 5 by CPU/memory)
- System information display

**Quick Start:**
```bash
cd Server-Performance-Stats
./server-stats.sh --cpu  # View CPU usage
```

For more details, see [Server-Performance-Stats/README.md](Server-Performance-Stats/README.md)

---

## System Requirements

- Linux operating system
- Bash 4.0+
- Standard Unix utilities (`tar`, `top`, `df`, `awk`, etc.)

## Getting Started

1. Clone or download this repository
2. Navigate to the desired tool directory
3. Make the script executable: `chmod +x script-name.sh`
4. Run with appropriate arguments

## License

These scripts are provided as-is for system administration purposes.
