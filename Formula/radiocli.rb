class Radiocli < Formula
  desc "Terminal-first world radio receiver"
  homepage "https://github.com/Ciphore/RadioCLI"
  url "https://registry.npmjs.org/@ciphore/radiocli/-/radiocli-0.1.0.tgz"
  sha256 "25ef27303e5497d2880daeae9db6ec5010540dc475b86a278226c44d3194ef58"
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
