require "formula"

class Beanstalk < Formula
  homepage "http://kr.github.io/beanstalkd/"
  url "https://github.com/kr/beanstalkd/archive/v1.10.tar.gz"
  sha1 "bfc0ccf99e15b15eac03ec1d8a57a3aaff143237"

  bottle do
    sha1 "054320dc87c106976408f6bf195a87244635bb05" => :mavericks
    sha1 "df0173105d8b03f21e88a38f0c0b787a9d06023b" => :mountain_lion
    sha1 "608a644891b4648750760a5fb70eaecaba130d2b" => :lion
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  plist_options :manual => "beanstalkd"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/beanstalkd</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{var}</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/beanstalkd.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/beanstalkd.log</string>
      </dict>
    </plist>
    EOS
  end
end
