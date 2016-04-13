#
# Minimal service to serve contents from the file system over HTTP.
#
FROM scratch

MAINTAINER Henrik Jonsson <me@hkjn.me>

# Path inside the container to serve files from. Likely will be
# bind mounted from host path or another container at runtime.
ENV FILES_DIR /var/www

# WORKDIR /usr/local/bin
# COPY ["fileserver", "/fileserver"]
ADD fileserver /
CMD ["/fileserver"]
