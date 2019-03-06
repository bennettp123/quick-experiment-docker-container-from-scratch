# An image from scratch

This is an experiment to see how small an image can be made, while still actually doing something.

This Dockerfile produces an image that is 14k in size.

```
FROM alpine:3.9
RUN apk add --no-cache gcc libc-dev
COPY main.c .
RUN gcc -Os -o main -static main.c && strip main

FROM scratch
COPY --from=0 main .

CMD ["./main"]
```

For reference, the `busybox` image is 1.1M, so this is considerably smaller.

It's not as small as the official `hello-world` example, though. That's only 1.8k! 

```
$ docker build -t foo .
$ docker run --rm -it foo
Hello World
$ docker image inspect foo --format='{{.Size}}'
14610
```
