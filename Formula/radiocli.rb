class Radiocli < Formula
  desc "Terminal-first world radio receiver"
  homepage "https://github.com/Ciphore/RadioCLI"
  url "https://registry.npmjs.org/@ciphore/radiocli/-/radiocli-0.1.5.tgz"
  sha256 "665fd1e7ed7b1c805a8e321c7d23f467f9764991217b481224613126c8f23c71"
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
    assert_match "radiocli doctor", shell_output("#{bin}/radiocli --help")
    assert_match "playback=", shell_output("#{bin}/radiocli doctor")
  end
end
