class Kla < Formula
  desc "An HTTP CLI application for working with restful endpoints"
  homepage "https://github.com/d1ngd0/kla"
  version "0.4.2"

  if Hardware::CPU.arm?
    url "https://github.com/d1ngd0/kla/releases/download/0.4.2/kla-aarch64-apple-darwin.tar.gz"
    sha256 "4a922a00bd6cdf58e8cbc997270c2cb68f0e2a1dfa0c48768fa1456214d290ed"
  else
    url "https://github.com/d1ngd0/kla/releases/download/0.4.2/kla-x86_64-apple-darwin.tar.gz"
    sha256 "3d0f25993a3af7a8df6924a39309b83581a31752d47e71da433c57d14691e77a"
  end

  def install
    bin.install "kla"
  end

  test do
    system "#{bin}/kla", "--help"
  end
end
