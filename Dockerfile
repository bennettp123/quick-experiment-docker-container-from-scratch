FROM alpine:3.9
RUN apk add --no-cache gcc libc-dev
COPY main.c .
RUN gcc -Os -o main -static main.c && strip main

FROM scratch
COPY --from=0 main .

CMD ["./main"]

