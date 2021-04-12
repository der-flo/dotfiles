# frozen_string_literal: true

# Parts borrowed from Ryan Bates:
# https://github.com/ryanb/dotfiles/blob/master/Rakefile

require 'bundler/inline'
gemfile do
  source 'https://rubygems.org'
  gem 'rake'

  # https://ttytoolkit.org
  gem 'tty-command', '~> 0.10.1'
  gem 'tty-logger', '~> 0.6.0'
end

require 'erb'

LOGGER = TTY::Logger.new
CMD = TTY::Command.new

desc 'install homebrew'
task :install_homebrew do
  if File.exist?('/usr/local/bin/brew')
    LOGGER.info 'homebrew already installed'
  else
    LOGGER.info 'installing homebrew…'

    # TODO: Handle errors
    CMD.run '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

    LOGGER.success 'homebrew installed'
  end
end

# TODO: Sync current state with Brewfile automatically?
desc 'install software via homebrew'
task homebrew: :install_homebrew do
  # TODO: Abort on error
  # TODO: Ausgaben durchreichen
  CMD.run 'brew bundle'
end

desc 'setup fish shell'
task :setup_fish do
  fish_path = '/usr/local/bin/fish'
  if IO.read('/etc/shells').lines.include? "#{fish_path}\n"
    LOGGER.info 'fish already in /etc/shells'
  else
    CMD.run "echo #{fish_path} | sudo tee -a /etc/shells"
    LOGGER.success 'added fish to /etc/shells'
  end

  if `dscl . -read ~/ UserShell`.split(' ')[1] == fish_path
    LOGGER.info 'user shell is already fish'
  else
    CMD.run "chsh -s #{fish_path}"
    LOGGER.success 'changed user shell to fish'
  end

  if CMD.run!("fish -c 'omf doctor'").success?
    LOGGER.info 'oh-my-fish is already installed'
  else
    system 'curl -L https://get.oh-my.fish | fish'
    LOGGER.success 'installed oh-my-fish'
  end
end

desc 'install VIM plugins'
task :install_vim_plugins do
  # TODO: Das klappt nicht immer, weil
  # 1. die Config nicht mit dem alten System-Vim harmoniert
  # 2. die Plugins am Anfang noch nicht installiert sind und so
  #    viele Funktionen etc. noch nicht verfügbar sind.
  system 'vim +PlugUpdate +qall >/dev/tty'
end

desc 'link dotfiles'
task :link_files do
  %w[git misc ruby vim].each do |dir|
    handle_files(Dir.glob("#{dir}/*"))
  end
  handle_files(Dir.glob('zsh/z*'))

  FileUtils.mkdir_p "#{Dir.home}/bin"

  handle_file('bin/getswap', 'bin/getswap')
  handle_file('bin/git-icdiff', 'bin/git-icdiff')
  handle_file('fish/fish', '.config/fish')
  handle_file('fish/omf', '.config/omf')
  if mac?
    handle_file('hammerspoon', '.hammerspoon')

    # https://pqrs.org/osx/karabiner/document.html#configuration-file-path
    handle_file('karabiner', '.config/karabiner')

    # TODO: iTerm konfigurieren
  end
end

# TODO: Error handling
desc 'install software and link dotfiles'
task default: %i[homebrew setup_fish install_vim_plugins link_files] do
end

HOSTNAME = `hostname -s`.chomp
EMAIL = case HOSTNAME
        when 'flo-mini' then 'mail@florian-duetsch.de'
        when 'flo' then 'florian.duetsch@adigi.ai'
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
