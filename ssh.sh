#!/bin/bash

#must install expect

expect<<EOF
set timeout 1
spawn ssh-keygen -t rsa
expect "(/root/.ssh/id_rsa):"
send "\r"
expect "(empty for no passphrase):"
send "\r"
expect "again:"
send "\r"
expect eof
exit
EOF
expect<<EOF
set timeout 1
spawn ssh-copy-id 192.168.122.111
expect "(yes/no)?"
send "yes\r"
expect "password:"
send "redhat\n"
expect eof
EOF
ssh 192.168.122.111
