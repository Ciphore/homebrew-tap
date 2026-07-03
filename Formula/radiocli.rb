class Radiocli < Formula
  desc "Terminal-first world radio receiver"
  homepage "https://github.com/Ciphore/RadioCLI"
  url "https://registry.npmjs.org/@ciphore/radiocli/-/radiocli-0.1.8.tgz"
  sha256 "4f4cfa0040b3d7582d62f1ac909db0cda65952da4fef6f92b47bc80db0802568"
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
