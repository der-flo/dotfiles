# File borrowed from Ryan Bates:
# https://github.com/ryanb/dotfiles/blob/master/Rakefile

require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
    handle_file(file)
  end
  Dir['zprezto/runcoms/*'].each do |file|
    basename = File.basename(file)
    next if basename == 'README.md'
    handle_file(file, ".#{basename}")
  end
end

HOSTNAME = `hostname -s`.chomp
EMAIL = case HOSTNAME
        when 'flo-mb' then 'mail@florian-duetsch.de'
        when 'flo', 'nix-wie-weg' then 'florian.duetsch@nix-wie-weg.de'
        end

def replace_file(file, dest_path)
  system %Q{rm -rf #{dest_path}}
  link_file(file, dest_path)
end

def link_file(file, dest_path)
  if file =~ /.erb$/
    puts "generating #{dest_path}"
    File.open(dest_path, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking #{dest_path}"
    system %Q{ln -s "$PWD/#{file}" "#{dest_path}"}
  end
end

def handle_file(file, dest_file = nil)
  replace_all = false
  dest_file ||= ".#{file.sub('.erb', '')}"
  dest_path = File.join(ENV['HOME'], dest_file)
  if File.exist?(dest_path)
    if File.identical?(file, dest_path)
      puts "identical ~/#{dest_file}"
    elsif replace_all
      replace_file(file, dest_path)
    else
      print "overwrite ~/#{dest_file}? [ynaq] "
      case $stdin.gets.chomp
      when 'a'
        replace_all = true
        replace_file(file, dest_path)
      when 'y'
        replace_file(file, dest_path)
      when 'q'
        exit
      else
        puts "skipping ~/#{dest_file}"
      end
    end
  else
    link_file(file, dest_path)
  end
end

