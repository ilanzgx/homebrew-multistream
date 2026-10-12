cask "multistream" do
  version "0.19.3"

  on_arm do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-arm64.dmg"
    sha256 "c181163bcb3b7fdf54de3e8ceaa61307781cfdd7a2fb100b00f31e4703253859"
  end

  on_intel do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-x64.dmg"
    sha256 "0ec7a36432856aa4bda892880382fabd066e7af1249cf9c3184011298d9e5747"
  end

  name "Multistream"
  desc "Watch multiple live streams simultaneously"
  homepage "https://usemultistream.vercel.app/"

  app "Multistream.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Multistream.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.ilanzgx.multistream",
    "~/Library/Preferences/com.ilanzgx.multistream.plist",
    "~/Library/Logs/Multistream",
  ]
end
