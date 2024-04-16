FROM rust:bullseye
WORKDIR /app

CMD cargo build --release
