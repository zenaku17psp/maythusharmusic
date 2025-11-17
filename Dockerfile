FROM python:3.11-slim

WORKDIR /app

# requirements.txt ကိုအရင်ကူးပါ
COPY requirements.txt .

# Install system dependencies, Deno, and Python packages in a single layer
RUN apt-get update -y && apt-get upgrade -y \
    # Install system dependencies
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        curl \
        unzip \
        git \
    # Install Deno
    && curl -fsSL https://deno.land/install.sh | sh \
    && ln -s /root/.deno/bin/deno /usr/local/bin/deno \
    # Install Python dependencies
    && pip3 install -U pip \
    # requirements.txt ကနေ dependencies တွေကို install လုပ်ပါ
    && pip3 install -U -r requirements.txt --no-cache-dir \
    # Clean up apt cache
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the rest of the application code
COPY . .

# Set the default command
CMD ["bash", "start"]
