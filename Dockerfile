from ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Install Required Tools
RUN rm /var/lib/apt/lists/* -vfR && \
    apt-get update && \
    apt-get install -y vim wget curl tar git bash-completion software-properties-common \
                        apt-file bc cmake man nano rpm telnet tree traceroute 

# Install Clang, Obj-C, GDB, Python3, Fortran, COBOL
RUN rm /var/lib/apt/lists/* -vfR && \
    apt-get update && \
    apt-get install -y clang gobjc gdb python3 python3-pip libpython-dev libblocksruntime-dev gfortran open-cobol

# Install C#
RUN apt install gnupg ca-certificates && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt update
RUN apt install -y mono-devel

# Install Java
RUN echo "oracle-java11-installer shared/accepted-oracle-license-v1-2 select true" | debconf-set-selections && \
    add-apt-repository ppa:linuxuprising/java && \
    rm /var/lib/apt/lists/* -vfR && \
    apt-get update && \
    apt-get install -y oracle-java11-installer && \
    apt-get install -y oracle-java11-set-default

# Install Go
WORKDIR /tmp
RUN wget https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
RUN tar -C /usr/local/ -xzf go1.12.1.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# Install Swift
WORKDIR /
RUN wget https://swift.org/builds/swift-5.0-release/ubuntu1804/swift-5.0-RELEASE/swift-5.0-RELEASE-ubuntu18.04.tar.gz && \
    tar xzf swift-5.0-RELEASE-ubuntu18.04.tar.gz && \
    rm swift-5.0-RELEASE-ubuntu18.04.tar.gz && \
    mv swift-5.0-RELEASE-ubuntu18.04 swift
ENV PATH=/swift/usr/bin:"${PATH}"

# Install Ada
RUN rm /var/lib/apt/lists/* -vfR && \
    apt-get update && \
    apt-get install -y gnat gnat-gps

# Install Common LISP
RUN apt-get install -y sbcl emacs slime

# Install Prolog
WORKDIR /tmp/
RUN wget http://www.gprolog.org/gprolog-1.4.5.tar.gz
RUN tar -xvf gprolog-1.4.5.tar.gz
RUN cd gprolog-1.4.5/src && ./configure && make && make install

# Install smalltalk
RUN apt-get install -y gawk gnu-smalltalk

# Install Haskell
RUN apt-get install -y haskell-platform

# Install Apache2, PHP, Perl, Ruby
ENV TERM=xterm
ENV TZ="Asia/Kolkata"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-add-repository ppa:brightbox/ruby-ng && \
    rm /var/lib/apt/lists/* -vfR && \
    apt-get update && \
    apt-get install -y tzdata apache2 php libapache2-mod-php perl ruby

# Install Lua, PLT Scheme
RUN add-apt-repository ppa:plt/racket && \
    rm /var/lib/apt/lists/* -vfR && \
    apt-get update && \
    apt-get install -y lua5.3 racket

# Update
RUN rm /var/lib/apt/lists/* -vfR && \
    apt-get update && \
    apt-get upgrade -y &&\
    apt-get dist-upgrade -y
RUN rm -R /tmp/*

# Finish Up
RUN apt-get install -y sudo && \
    useradd -p password -m ubuntu
USER ubuntu
RUN echo PS1="'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '" >> ~/.bashrc
WORKDIR /home/ubuntu/workspace

# To Build: docker build -t darthsidious .
# To Run: docker run -it --rm --privileged -h darthsidious --name darthsidious -v "$(pwd)"/workspace:/home/ubuntu/workspace darthsidious
