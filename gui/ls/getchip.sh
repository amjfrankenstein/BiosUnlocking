#!/bin/bash

flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 > ls/unl/chip.out
#flashrom -p dediprog > ls/unl/chip.out
