# Parts borrowed from Ryan Bates:
# https://github.com/ryanb/dotfiles/blob/master/Rakefile

require 'rake'
require 'erb'

# TODO: Error handling

desc "install the dot files into user's home directory"
task :install do
  `git submodule update --init --recursive`
  `chmod +x ~/.rvm/hooks/after_cd_bundler`

  %w(git misc ruby vim).each do |dir|
    handle_files(Dir.glob("#{dir}/*"))
  end

  handle_file('rvm_gemsets_global_gems', '.rvm/gemsets/global.gems')

  if mac?
    unless File.exist?('~/bin/git-credential-osxkeychain')
      `mkdir -p ~/bin && cd ~/bin && curl -s -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain`
    end
    `brew install reattach-to-user-namespace git`
    handle_file('sublime/Preferences.sublime-settings',
                'Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings')
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
