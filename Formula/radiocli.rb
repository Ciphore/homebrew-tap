class Radiocli < Formula
  desc "Terminal-first world radio receiver"
  homepage "https://github.com/Ciphore/RadioCLI"
  url "https://registry.npmjs.org/@ciphore/radiocli/-/radiocli-0.1.3.tgz"
  sha256 "0cb512620beae9ab84655a74cfbde42bfacd75443314658e4b96b3e480aa18c4"
  license "MIT"

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
