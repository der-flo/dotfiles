# Parts borrowed from Ryan Bates:
# https://github.com/ryanb/dotfiles/blob/master/Rakefile

require 'rake'
require 'erb'

# TODO: Error handling

desc "install the dotfiles into user's home directory"
task :install do
  install_prezto

  # puts `git submodule update --init --recursive`
  puts `vim +PlugUpdate +qall >/dev/tty`
  puts `chmod +x ~/.rvm/hooks/after_cd_bundler`

  %w(git misc ruby vim).each do |dir|
    handle_files(Dir.glob("#{dir}/*"))
  end
  handle_files(Dir.glob('prezto/z*'))

  FileUtils.mkdir_p "#{Dir.home}/bin"

  handle_file('bin/getswap', 'bin/getswap')
  handle_file('bin/git-icdiff', 'bin/git-icdiff')

  if mac?
    handle_files(Dir.glob('mac_misc/*'))

    prefsync 'mac_plist/com.googlecode.iterm2.plist'

    # For tmux
    # TODO: Still needed?
    `brew install reattach-to-user-namespace`

    # TODO: Do I need this files versioned?
    prefsync 'alfred/com.runningwithcrayons.Alfred-2.plist'
    prefsync 'alfred/com.runningwithcrayons.Alfred-Preferences.plist'

    handle_file('alfred/Alfred.alfredpreferences',
                'Library/Application Support/Alfred 2/Alfred.alfredpreferences')
  end
end

HOSTNAME = `hostname -s`.chomp
EMAIL = case HOSTNAME
        when 'flo-mb', 'flo-mini' then 'mail@florian-duetsch.de'
        when 'flo', 'nix-wie-weg' then 'florian.duetsch@nix-wie-weg.de'
        end

def replace_file(file, dest_path)
  system %(rm -rf "#{dest_path}")
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
    system %(ln -s "$PWD/#{file}" "#{dest_path}")
  end
end

def handle_file(file, dest_file = nil)
  dest_file ||= ".#{file.split('/').last.sub('.erb', '')}"
  dest_path = File.join(Dir.home, dest_file)

  if File.exist?(dest_path)
    if File.identical?(file, dest_path)
      puts "identical ~/#{dest_file}"
    else
      print "overwrite ~/#{dest_file}? [ynq] "
      case $stdin.gets.chomp
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
  files.each { |f| handle_file(f) }
end

def mac?
  RUBY_PLATFORM.downcase.include?('darwin')
end

def install_prezto
  dir = File.join(Dir.home, '.zprezto')
  unless File.exist?(dir)
    puts `git clone --recursive https://github.com/der-flo/prezto.git #{dir}`
  end
  puts `cd #{dir} && \
        git pull --rebase && \
        git submodule update --init --recursive`
end

# https://github.com/asmeurer/prefsync
def prefsync(file)
  ps = 'cd prefsync && python -m prefsync'
  dest = "~/Library/Preferences/#{File.basename(file)}"
  src = File.expand_path(file)

  # TODO: Handle "Operation already in progress"?
  puts `#{ps} #{dest} #{src}`
end
