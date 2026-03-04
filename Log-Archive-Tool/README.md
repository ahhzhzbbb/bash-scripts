# Log Archive Tool

A bash script that compresses and archives log directories with timestamps.

## Project URL
https://roadmap.sh/projects/log-archive-tool

## Overview

`log-archive.sh` is a utility script that takes a log directory as input and creates a compressed tar.gz archive with a timestamp. It stores the archive in a designated archive directory (`/var/archive_logs`).

## Features

- **Timestamped Archives**: Automatically adds a timestamp to each archive file for easy tracking
- **Compression**: Uses gzip compression to minimize storage space
- **Error Handling**: Includes error checking for invalid directories and failed compression
- **Safe Execution**: Uses bash strict mode for reliable error handling

## Usage

```bash
./log-archive.sh <log-directory>
```

### Parameters

- `<log-directory>`: The path to the directory containing logs to be archived

### Example

```bash
./log-archive.sh /var/log/application
```

This will create an archive file like `log_archive_20260304_143025.tar.gz` in `/var/archive_logs/`.

## Requirements

- Bash 4.0+
- `tar` command with gzip support
- Appropriate permissions to read the source log directory
- Write permissions to `/var/archive_logs` (may require sudo)

## Output

Archived files are stored in: `/var/archive_logs/log_archive_YYYYMMDD_HHMMSS.tar.gz`

## Future Enhancements

The script includes commented-out code for uploading archives to Cloudflare R2 object storage. This can be enabled by:

1. Uncomenting the AWS S3 upload section
2. Configuring AWS credentials
3. Ensuring the AWS CLI is installed

## Error Messages

- **"Usage: $0 + <log-directory>"**: No directory argument provided
- **"Error: Directory does not exist."**: The specified directory path is invalid
- **"Failed Compressing"**: The tar compression command failed
