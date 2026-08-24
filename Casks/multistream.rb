cask "multistream" do
  version "0.18.16"

  on_arm do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-arm64.dmg"
    sha256 "e4a5174a455bddf0a1abe24ab9268073f7c0e0d00da8bd770be50f7df5cf7057"
  end

  on_intel do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-x64.dmg"
    sha256 "ca8355c9b47d698b64a1d6fc3a097686f03d966638038c6c6cac1b36bec76337"
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
