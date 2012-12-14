# -*-ruby-*-

require 'irb/completion'
require 'rubygems'
require 'yaml'
require 'pp'

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history" 
IRB.conf[:PROMPT_MODE]  = :SIMPLE

# start wirble (with color)
begin
  require 'wirble'
  Wirble.init
  # Wirble.colorize unless IRB.conf[:PROMPT_MODE] == :INF_RUBY
rescue LoadError
end

# Just for Rails...
if rails_env = ENV['RAILS_ENV']
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN   => "=> %s\n" 
  }
  IRB.conf[:PROMPT_MODE] = :RAILS
  
  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  IRB.conf[:IRB_RC] = Proc.new do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.instance_eval { alias :[] :find }
  end
end

def profile
  t = Time.now
  yield
  "Took #{Time.now - t} seconds."
end
