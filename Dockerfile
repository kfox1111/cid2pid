FROM docker.io/library/ubuntu:24.10 as build
RUN \
	apt-get update && \
	apt-get install -y gcc libtracefs-dev pkg-config libtraceevent-dev

COPY * /build/
WORKDIR /build

RUN \
  pkg-config --cflags --libs /usr/lib/*-linux-gnu/pkgconfig/libtracefs.pc && \
  gcc -o cid2pid cid2pid.c -static /usr/lib/*-linux-gnu/libtracefs.a /usr/lib/*-linux-gnu/libtraceevent.a -I/usr/include/tracefs -I/usr/include/traceevent

FROM gcr.io/distroless/static-debian12
COPY --from=build /build/LICENSE /LICENSE
COPY --from=build /build/cid2pid /usr/bin/cid2pid
ENTRYPOINT ["/usr/bin/cid2pid"]
