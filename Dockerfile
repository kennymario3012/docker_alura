FROM node
WORKDIR /app_mode
COPY . .
RUN npm install -g npm@8.14.0
ENTRYPOINT npm start