puts"#{user},введи команду языка ruby"
rubycomand=STDIN.gets.chomp
puts"#{user},введи команду ОС"
occomand=STDIN.gets.chomp
system "ruby -e \"#{rubycomand}\""
system occomand