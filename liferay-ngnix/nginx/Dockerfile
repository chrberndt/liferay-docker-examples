# Use the official nginx image as parent image
FROM nginx:1.20.2

COPY nginx.conf /etc/nginx/
COPY conf.d/default.conf /etc/nginx/conf.d

RUN mkdir -p /opt/nginx/mycache && chown nginx:nginx /opt/nginx/mycache

CMD ["nginx", "-g", "daemon off;"]
