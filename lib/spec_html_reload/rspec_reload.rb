class RspecReload < RSpec::Core::Formatters::HtmlFormatter
  # This registers the notifications this formatter supports, and tells
  # us that this was written against the RSpec 3.x formatter API.
  RSpec::Core::Formatters.register self, :start, :example_group_started, :start_dump,
                                         :example_started, :example_passed, :example_failed,
                                         :example_pending, :dump_summary

  def initialize(output)
    super(output)
    @failed_examples = []
    @example_group_number = 0
    @example_number = 0
    @header_red = nil
    @printer = LiveHtmlPrinter.new(output)
  end
end

class LiveHtmlPrinter < RSpec::Core::Formatters::HtmlPrinter
  def print_html_start
    @output.puts LIVE_HTML_HEADER
    @output.puts REPORT_HEADER
  end

  LIVE_HTML_HEADER = <<-EOF
<!DOCTYPE html>
<html lang='en'>
<head>
  <script type="text/javascript">
    WEB_SOCKET_SWF_LOCATION = "/__rack/WebSocketMain.swf";
    
  </script>
  <script type="text/javascript" src="/__rack/swfobject.js"></script>
  <script type="text/javascript" src="/__rack/web_socket.js"></script>
  <script type="text/javascript">
    RACK_LIVERELOAD_PORT = 3004;
  </script>
  <script type="text/javascript" src="http://localhost:3004/livereload.js?"></script>
  <title>RSpec results</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="Expires" content="-1" />
  <meta http-equiv="Pragma" content="no-cache" />
  <style type="text/css">
  body {
    margin: 0;
    padding: 0;
    background: #fff;
    font-size: 80%;
  }
  </style>
  <script type="text/javascript">
    // <![CDATA[
#{GLOBAL_SCRIPTS}
    // ]]>
  </script>
  <style type="text/css">
#{GLOBAL_STYLES}
  </style>
</head>
<body>
EOF
end