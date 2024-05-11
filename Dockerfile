FROM ros:humble

RUN apt update && apt install -y nano && -rf /var/lib/apt/lists/*

COPY config/ /site_config/