FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      wget \
      ca-certificates \
      gcc \
      libc-dev && \
    apt-get autoremove && \
    apt-get clean

RUN cd ~ && \
    wget https://static.rust-lang.org/dist/rust-1.51.0-aarch64-unknown-linux-gnu.tar.gz && \
    tar -xzf rust-1.51.0-aarch64-unknown-linux-gnu.tar.gz && \
    ./rust-1.51.0-aarch64-unknown-linux-gnu/install.sh && \
    rm -r ~/rust* && \
    cargo install fmlrc 
  
ENV PATH="${PATH}:/root/.cargo/bin"
