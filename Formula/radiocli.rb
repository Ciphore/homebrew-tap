class Radiocli < Formula
  desc "Terminal-first world radio receiver"
  homepage "https://github.com/Ciphore/RadioCLI"
  url "https://registry.npmjs.org/@ciphore/radiocli/-/radiocli-0.2.6.tgz"
  sha256 "33e737e0397cf09d182e3004b6c978ce0fa998e6d039992096349ce61f428186"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "mpv"
  depends_on "node"

  def install
    system "npm", "install", "--min-release-age=0",
           *std_npm_args(prefix: libexec).tap { |args| args.delete("--min-release-age=1") }
    bin.install_symlink libexec/"bin/radiocli"
  end

  test do
    assert_match "Usage: radiocli", shell_output("#{bin}/radiocli --help")
    assert_match "playback=", shell_output("#{bin}/radiocli doctor")
  end
end
