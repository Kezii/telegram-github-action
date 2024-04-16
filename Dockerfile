FROM rust:bullseye as builder
WORKDIR /app

COPY Cargo.toml .
COPY Cargo.lock Cargo.lock
RUN  mkdir -p src && \
    echo "fn main() { panic!(\"palle!\"); }" > src/main.rs 
RUN cargo build --release
RUN rm -rf src/ && rm -rf target/release/telegram-github-acttion


COPY src/ src/
RUN rustc --version && touch src/main.rs && cargo build --release

FROM debian:bullseye-slim
WORKDIR /app
COPY --from=builder /app/target/release/telegram-github-acttion /app/telegram-github-acttion

CMD ["/app/telegram-github-acttion"]
