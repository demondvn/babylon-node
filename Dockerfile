FROM golang:latest
RUN apt update && apt install curl tar wget clang pkg-config libssl-dev jq build-essential bsdmainutils make ncdu gcc git jq chrony liblz4-tool -y
RUN git clone https://github.com/babylonchain/babylon
# WORKDIR /babylon
RUN cd babylon &&  git checkout v0.5.0 && make install
# RUN make install
ARG MONIKER
COPY script.sh script.sh
RUN chmod +x script.sh

CMD ./script.sh && $(which babylond) start
