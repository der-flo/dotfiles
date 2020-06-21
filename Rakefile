# frozen_string_literal: true

# Parts borrowed from Ryan Bates:
# https://github.com/ryanb/dotfiles/blob/master/Rakefile

require 'rake'
require 'erb'

# TODO: Sync current state with Brewfile automatically?
desc 'install software via homebrew'
task :homebrew do
  system 'brew bundle'
end

# TODO: Error handling
desc "install the dotfiles into user's home directory"
task install: [:homebrew] do
  # TODO: Das klappt nicht immer, weil
  # 1. die Config nicht mit dem alten System-Vim harmoniert
  # 2. die Plugins am Anfang noch nicht installiert sind und so
  #    viele Funktionen etc. noch nicht verfügbar sind.
  puts `vim +PlugUpdate +qall >/dev/tty`

  puts `curl -L https://get.oh-my.fish | fish`

  handle_files(Dir.glob("vim/*"))
  handle_files(Dir.glob("git/*"))
  handle_file('misc/tmux.conf')
  handle_file('misc/ripgreprc')
  %w(git misc ruby vim).each do |dir|
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

# TODO
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
