FROM ubuntu:16.04
MAINTAINER mkl

ARG GOVERSION=1.8.3

# Install some basic utilities
# We may use ssh for port forwarding
RUN apt-get update && \
 apt-get install --yes mc wget git nano net-tools inetutils-ping vim openssh-server sshpass jq

# Install go
RUN wget https://storage.googleapis.com/golang/go${GOVERSION}.linux-amd64.tar.gz && \
 tar -C /usr/local -xzf go${GOVERSION}.linux-amd64.tar.gz && \
 rm go${GOVERSION}.linux-amd64.tar.gz

RUN mkdir /gocode

# Install btcd
ENV PATH=$PATH:/usr/local/go/bin GOROOT=/usr/local/go
ENV GOPATH=/gocode PATH=$PATH:/gocode/bin

RUN go get -u github.com/Masterminds/glide
# Flag for rebuild Dockerfile from this point
ARG rebuild=1
RUN mkdir -p /tmp/${rebuild}

# We install btcd first using roasbeef's fork with segwit support
ARG BTCDCOMMIT=master
RUN git clone https://github.com/roasbeef/btcd \
 $GOPATH/src/github.com/roasbeef/btcd
WORKDIR $GOPATH/src/github.com/roasbeef/btcd
RUN git checkout $BTCDCOMMIT
RUN glide install
RUN go install . ./cmd/...

# Installation of lnd related stuff
ARG LNDCOMMIT=litecoin-simnet-upd
ARG LNDREP=https://github.com/BitfuryLightning/lnd
RUN git clone $LNDREP $GOPATH/src/github.com/lightningnetwork/lnd
WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd
RUN git checkout $LNDCOMMIT
RUN glide install
RUN go install . ./cmd/...

# Use ssh for port forwarding. Lnd listen on grpc on localhost
# so we use ssh to forward ports
RUN mkdir /var/run/sshd
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN printf "\nGatewayPorts yes\n" >>/etc/ssh/sshd_config

# Install scripts
RUN mkdir /simnet
WORKDIR /simnet
ADD bin bin
# Create certificates for btcd
RUN mkdir -p "/simnet/rpc"
RUN "gencerts" --host="*" --directory="/simnet/rpc" --force
ENV PATH=/simnet/bin:$PATH

VOLUME /save_simnet
ENTRYPOINT ["/simnet/bin/start.sh"]