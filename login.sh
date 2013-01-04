#!/usr/bin/expect
#set timeout -1
spawn ssh [lindex $argv 0]@[lindex $argv 1]
expect {
"*yes/no)?" { send "yes\r" }
}
expect "*password:"
send [lindex $argv 2]\r
expect eof
