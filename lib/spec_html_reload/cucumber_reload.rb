require 'erb'
require 'builder'
require 'cucumber/formatter/duration'
require 'cucumber/formatter/io'
require 'cucumber/formatter/html'

class CucumberReload < Cucumber::Formatter::Html
  def initialize(runtime, path_or_io, options)
    super
    @lines = {}
  end

  def before_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
    super
    if status == :failed || status == :pending || status == :undefined
      line = file_colon_line.split(':')
      (@lines[line[0]] ||= '') << ":#{line[1]}"
    end
  end

  def after_features(features)
    super
    rerun = ''
    @lines.map do |key, value|
      rerun.concat ' ' if rerun.present?
      rerun.concat "#{key}#{value}"
    end
    file = File.new 'tmp/rerun.txt', 'w'
    if rerun.present?
      file.puts rerun
    else
      File.delete file
    end
  end

  def inline_js
    @builder.script(:type => 'text/javascript') do
      @builder << inline_jquery
      @builder << inline_js_content
    end
    @builder << reloadjs
  end
  
  def reloadjs
    port = 3004
    <<-EOF
    <script type="text/javascript">
      WEB_SOCKET_SWF_LOCATION = "/__rack/WebSocketMain.swf";
      
    </script>
    <script type="text/javascript" src="/__rack/swfobject.js"></script>
    <script type="text/javascript" src="/__rack/web_socket.js"></script>
    <script type="text/javascript">
      RACK_LIVERELOAD_PORT = #{port};
    </script>
    <script type="text/javascript" src="http://192.168.99.101:#{port}/livereload.js?"></script>
    EOF
  end
end
