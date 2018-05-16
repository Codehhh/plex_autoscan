#!/bin/bash
# Create default config
python /opt/plex_autoscan/scan.py
# Start server
python /opt/plex_autoscan/scan.py --config /config/config.py --queuefile /config/queue.db --logfile /config/log.txt --loglevel DEBUG server
