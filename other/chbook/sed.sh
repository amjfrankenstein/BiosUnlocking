#!/bin/bash
sed 's/\x62\x6C\x6F\x63\x6B\x5F\x64\x65\x76\x6D\x6F\x64\x65\x01\x31/\x62\x6C\x6F\x63\x6B\x5F\x64\x65\x76\x6D\x6F\x64\x65\x01\x30/g' 1.bin > 11.bin
sed 's/\x65\x63\x6B\x5F\x65\x6E\x72\x6F\x6C\x6C\x6D\x65\x6E\x74\x01\x31/\x65\x63\x6B\x5F\x65\x6E\x72\x6F\x6C\x6C\x6D\x65\x6E\x74\x01\x30/g' 11.bin > 111.bin
sed 's/\x61\x68\x61\x5F\x70\x69\x6E\x67\x5F\x73\x65\x6E\x74\x01\x31/\x61\x68\x61\x5F\x70\x69\x6E\x67\x5F\x73\x65\x6E\x74\x01\x30/g' 111.bin > 3.bin 
rm 11.bin 111.bin