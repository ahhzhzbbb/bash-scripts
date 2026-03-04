#!/bin/bash
set -euo pipefail

if [[ -z "$1" ]]; then
    echo "Usage: $0 + <log-directory>"
    exit 1
fi

if [[ ! -d "$1" ]]; then
    echo "Error: Directory does not exist."
    exit 1
fi

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

ARCHIVE_FILE="log_archive_${TIMESTAMP}.tar.gz"

AC_DIR="/var/archive_logs"

BUCKET="log-archive"
S3_API="https://8aa21ac41600f49624fe3a05cfec79ef.r2.cloudflarestorage.com"

mkdir -p "$AC_DIR"

sudo tar czf "${AC_DIR}/${ARCHIVE_FILE}" "$1"

if [[ "$?" -ne 0 ]]; then
    echo "Failed Compressing"
    exit 1
fi

# aws s3 cp "${AC_DIR}/${ARCHIVE_FILE}" "s3://${BUCKET}" \
#         --endpoint-url "${S3_API}" \
#         --region auto

# if [[ "$?" -ne 0 ]]; then
#     echo "Failed Upload to R2 storage"
#     exit 1
# fi
