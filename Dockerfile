FROM node:20.9.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    cron \
    && rm -rf /var/lib/apt/lists/*

    
COPY crontab /etc/cron.d/mobex-crontab
COPY index.js /usr/local/bin/index.js
COPY run_script.sh /usr/local/bin/run_script.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod 0644 /etc/cron.d/mobex-crontab
RUN chmod +x /usr/local/bin/run_script.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
