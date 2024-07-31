#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y git build-essential libpam0g-dev libxcb-xkb-dev

# Install zig
wget https://ziglang.org/download/0.12.0/zig-linux-x86_64-0.12.0.tar.xz
tar xf zig-linux-x86_64-0.12.0.tar.xz

# Compile and install ly
git clone https://github.com/fairyglade/ly 
cd ly && ../zig-linux-x86_64-0.12.0/zig build installsystemd
