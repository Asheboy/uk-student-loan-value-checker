FROM node:20

USER node
WORKDIR /app

USER root
RUN apt-get update && apt-get install -y \
    chromium \
    libnss3 \
    libgconf-2-4 \
    libfreetype6 \
    libharfbuzz0b \
    ca-certificates \
    fonts-freefont-ttf \
    libnotify-bin \
    && rm -rf /var/lib/apt/lists/*
USER node

COPY --chown=node:node package.json yarn.lock ./

RUN yarn install

COPY --chown=node:node studentloans.js .

CMD [ "node", "studentloans.js" ]
