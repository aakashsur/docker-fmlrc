FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      ca-certificates \
      gcc \
      libc-dev && \
    apt-get autoremove && \
    apt-get clean

RUN cd ~ && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    . $HOME/.cargo/env && \
    cargo install fmlrc 
  
ENV PATH="${PATH}:/root/.cargo/bin"
