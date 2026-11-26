# Kaynaktan derlenir; hazır binary indirilmez.
# Builds from source; no prebuilt binary is downloaded.
class MacosFree < Formula
  desc "Display free and used memory, like the Linux free command"
  homepage "https://github.com/wo1fi3ms/macos-free"
  url "https://github.com/wo1fi3ms/macos-free/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "d6cf6b280f20ce11aba6cd002dafd63145bf356435893b1b899fd7972322bfcc"
  license "MIT"

  depends_on :macos

  def install
    system "make", "free"
    bin.install "free"
    man1.install "free.1"
  end

  test do
    assert_match "free (macOS) #{version}", shell_output("#{bin}/free -V")
    output = shell_output("#{bin}/free -b")
    assert_match(/^Mem:\s+\d+\s+\d+/, output)
    assert_match(/^Swap:/, output)
  end
end
