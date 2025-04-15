FROM gcc:latest AS builder
WORKDIR /app
COPY hello.cpp .
RUN g++ -static -o hello hello.cpp
FROM alpine:latest
COPY --from=builder /app/hello /hello
CMD ["/hello"]
