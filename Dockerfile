FROM node:alpine as Build

WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
RUN echo ....Building is done


FROM nginx as Deploy
EXPOSE 80
WORKDIR /usr/share/nginx/html
COPY --from=Build ./usr/app/build ./
RUN echo ....Deployment is done
