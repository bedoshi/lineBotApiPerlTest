# Container's image
FROM perl

LABEL maintainer="bedoshi <bedoshi@example.com>"

WORKDIR /app

# Execute with `docker build`
RUN cpanm Plack -n
RUN cpanm LINE::Bot::API -n

ENV PORT 3000
EXPOSE 3000
EXPOSE 8080
# Execute with `docker run`
COPY synopsis.psgi /root/synopsis.psgi

# Execute webserver with psgi file.
CMD plackup -I ./lib --listen :$PORT synopsis.psgi

COPY . /app