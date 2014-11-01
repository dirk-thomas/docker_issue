FROM ubuntu:trusty
MAINTAINER Dirk Thomas dthomas+docker@osrfoundation.org

VOLUME ["/var/cache/apt/archives"]

ENV DEBIAN_FRONTEND noninteractive

RUN useradd -u 1000 -m builder

RUN apt-get update
RUN apt-get install -q -y debhelper dpkg dpkg-dev git-buildpackage

ADD sourcedeb /tmp/sourcedeb

RUN chown -R builder:builder /tmp/sourcedeb

CMD ["su", "builder", "-c", "/tmp/sourcedeb/script/run.sh || echo 'run.sh has non-zero return code'"]
