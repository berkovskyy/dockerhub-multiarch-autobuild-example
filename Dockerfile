FROM golang as builder
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o hello .

FROM scratch
COPY --from=builder /app/hello /
CMD ["/hello"]
