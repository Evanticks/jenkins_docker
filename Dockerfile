FROM debian
RUN sed -i 's/http:/https:/g' /etc/apt/sources.list apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*
