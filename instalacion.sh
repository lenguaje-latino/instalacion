#!/usr/bin/env bash
cd ~
sudo git clone https://github.com/lenguaje-latino/latino-core
cd latino-core
sudo cmake .
sudo make install 