# From https://github.com/lucapette/dotfiles/blob/master/pryrc
def require_without_bundler gem
  _gem_path = Dir.glob("#{Gem.path.grep(/global$/).first}/gems/#{gem}*/lib").first
  if _gem_path
    $LOAD_PATH << _gem_path
    require gem
  else
    puts "Please put #{gem} in your global"
  end
end

# Based on https://github.com/danielbayerlein/dotfiles/blob/master/.pryr://github.com/danielbayerlein/dotfiles/blob/master/.pryrc

require_without_bundler 'awesome_print'
Pry.config.print = proc { |output, value| output.puts value.ai(:indent => 2) }

# require 'hirb'
# Hirb.enable
# old_print = Pry.config.print
# Pry.config.print = proc do |output, value|
#   Hirb::View.view_or_page_output(value) || old_print.call(output, value)
# end


rails = File.join(Dir.getwd, 'config', 'environment.rb')
if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  case Rails.version.to_i
  when 2
    require 'console_app'
    require 'console_with_helpers'
  when 3
    require 'rails/console/app'
    require 'rails/console/helpers'
    extend Rails::ConsoleMethods if Rails.version.to_f >= 3.2
  else
    warn "[WARN] cannot load Rails console commands"
  end
end

