FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    git \
    unzip \
    zip \
    libpq-dev \
    lsb-release \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    vim

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

# Install Node.js v20.11.1 manually
RUN curl -fsSL https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.xz -o node.tar.xz && \
    mkdir -p /usr/local/lib/nodejs && \
    tar -xJf node.tar.xz -C /usr/local/lib/nodejs && \
    rm node.tar.xz

# Set node and npm to PATH
ENV PATH="/usr/local/lib/nodejs/node-v20.11.1-linux-x64/bin:$PATH"

# Confirm versions
RUN node -v && npm -v

# Install Composer (latest)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Add user for Laravel (optional for permissions)
RUN useradd -m laravel && chown -R laravel:laravel /var/www

# Switch to non-root user (optional)
USER laravel

# Expose Laravel dev server port (if used)
EXPOSE 8000
