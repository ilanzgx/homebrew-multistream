cask "multistream" do
  version "0.19.0"

  on_arm do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-arm64.dmg"
    sha256 "e21df75a6fd50788bc1ed56b1caddefef982d1fe073b3c1d4a6102a580fd2437"
  end

  on_intel do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-x64.dmg"
    sha256 "785400af741d498b0d21026c288044314f83bbf2318c4eb06a42f49271694b50"
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
