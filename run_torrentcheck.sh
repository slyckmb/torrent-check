#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <torrent_filename> <download_path>"
  echo "Assumes the torrent file is located in /mnt/media/Downloads/torrents/archive"
  echo "and the download path root folder is /mnt/media/Downloads/torrents"
  echo "Example: ubuntu.torrent /seeding/ubuntu/" 
  exit 1
fi

# Assign arguments to variables
TORRENT_FILENAME="$1"
DOWNLOAD_PATH="$2"

# Define the Docker image name
IMAGE_NAME="xmseed234/torrent-check"

# Run the Docker command with the provided arguments
docker run --rm -v /mnt/media/Downloads/torrents/archive:/archive -v /mnt/media/Downloads/torrents:/torrents "$IMAGE_NAME" sh -c "/usr/local/bin/torrentcheck -t /archive/${TORRENT_FILENAME} -p /torrents/${DOWNLOAD_PATH} | less"
