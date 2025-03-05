#!/usr/bin/env ruby
# This script extracts the sender, receiver, and flags from a text message

puts ARGV[0].scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/).join(",")
