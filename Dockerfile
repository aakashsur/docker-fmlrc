FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      ca-certificates \
      gcc \
      libc-dev \
      git \
      zlib1g-dev \
      make && \
    apt-get autoremove && \
    apt-get clean

RUN cd ~ && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    . $HOME/.cargo/env && \
    cargo install fmlrc && \
    git clone https://github.com/lh3/ropebwt2.git && \
    cd ropebwt2 && \
    make && \
    mv ropebwt2 /usr/local/bin && \
    rm -r ~/ropebwt2
  
ENV PATH="${PATH}:/root/.cargo/bin"
