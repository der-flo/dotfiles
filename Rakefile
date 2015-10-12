# Parts borrowed from Ryan Bates:
# https://github.com/ryanb/dotfiles/blob/master/Rakefile

require 'rake'
require 'erb'

# TODO: Error handling

desc "install the dot files into user's home directory"
task :install do
  install_prezto

  # puts `git submodule update --init --recursive`
  puts `vim +PlugUpdate +qall`
  puts `chmod +x ~/.rvm/hooks/after_cd_bundler`

  %w(git misc ruby vim).each do |dir|
    handle_files(Dir.glob("#{dir}/*"))
  end
  handle_files(Dir.glob('prezto/z*'))

  handle_file('bin/getswap', 'bin/getswap')
  handle_file('bin/git-icdiff', 'bin/git-icdiff')

  if mac?
    `brew install reattach-to-user-namespace git`
    handle_file('alfred/appsupport', 'Library/Application Support/Alfred')
    # TODO: Alfred overrides the file permanently
    handle_file('alfred/com.alfredapp.Alfred.plist',
                'Library/Preferences/com.alfredapp.Alfred.plist')
  end
end

HOSTNAME = `hostname -s`.chomp
EMAIL = case HOSTNAME
        when 'flo-mb' then 'mail@florian-duetsch.de'
        when 'flo', 'nix-wie-weg' then 'florian.duetsch@nix-wie-weg.de'
        end

def replace_file(file, dest_path)
  system %Q{rm -rf "#{dest_path}"}
  link_file(file, dest_path)
end

def link_file(file, dest_path)
  if file =~ /.erb$/
    puts "generating #{dest_path}"
    File.open(dest_path, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking #{file} to #{dest_path}"
    system %Q{ln -s "$PWD/#{file}" "#{dest_path}"}
  end
end

def handle_file(file, dest_file = nil)
  replace_all = false
  dest_file ||= ".#{file.split('/').last.sub('.erb', '')}"
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

def handle_files(files)
  files.each do |f|
    handle_file(f)
  end
end

def mac?
  RUBY_PLATFORM.downcase.include?("darwin")
end


def install_prezto
  dir = File.join(ENV['ZDOTDIR'] || ENV['HOME'], '.zprezto')
  unless File.exists?(dir)
    puts `git clone --recursive https://github.com/der-flo/prezto.git #{dir}`
  end
  puts `cd #{dir} && git pull --rebase && git submodule update --init --recursive`
end
