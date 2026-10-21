cask "multistream" do
  version "0.19.5"

  on_arm do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-arm64.dmg"
    sha256 "8d2cacc335698574688c862f9235b2c64cc2a5527469971918d0172444f7dfa7"
  end

  on_intel do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-x64.dmg"
    sha256 "1f19a3bdd68a1a83a4587dadce6638348b43bf6732a3f8c7a059018b411d4630"
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
