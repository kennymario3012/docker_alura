FROM python:slim as dependency
WORKDIR /reqs
COPY requirements.txt .
RUN pip install -r requirements.txt


FROM node:lts as package
WORKDIR /packages
COPY package.json .
RUN npm install

FROM python:slim
RUN apt-get install && apt-get install nodejs -y
WORKDIR /home/app_mode
COPY ./code/ .
COPY --from=dependency /usr/local/lib/python3.7/site-packages /usr/local/lib/python3.7/site-packages
COPY --from=package /packages/node_modules /home/app/node_modules
ENTRYPOINT node server.js