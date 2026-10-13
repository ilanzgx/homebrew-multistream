cask "multistream" do
  version "0.19.4"

  on_arm do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-arm64.dmg"
    sha256 "f717c97c8fed235b1a4e947e17132ac6c86945ee72102e172de0f4d01a66dc1f"
  end

  on_intel do
    url "https://github.com/ilanzgx/multistream/releases/download/v#{version}/Multistream-macos-x64.dmg"
    sha256 "55f98f871cef370cf6a7408be89dfe1088d385d379c165b988ab144fac91137c"
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
