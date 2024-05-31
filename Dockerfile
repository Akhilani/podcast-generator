FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install Python dependencies
RUN pip3 install --upgrade pip  # Upgrade pip to the latest version
RUN pip3 install pyYAML

# Verify Python and pip installation
RUN python3 --version
RUN pip3 --version

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]