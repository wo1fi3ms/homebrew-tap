# Kaynaktan derlenir; hazır binary indirilmez.
# Builds from source; no prebuilt binary is downloaded.
class MacosFree < Formula
  desc "Display free and used memory, like the Linux free command"
  homepage "https://github.com/wo1fi3ms/macos-free"
  url "https://github.com/wo1fi3ms/macos-free/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "331a086a7219d87438c3d168140ba55f2ffe8965199186a2cd89167d464e44d3"
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
