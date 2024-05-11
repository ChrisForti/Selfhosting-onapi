FROM ros:humble

RUN apt update && apt install -y nano && rm -rf /var/lib/apt/lists/*

COPY config/ /site_config/