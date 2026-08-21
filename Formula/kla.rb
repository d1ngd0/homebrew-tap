class Kla < Formula
  desc "An HTTP CLI application for working with restful endpoints"
  homepage "https://github.com/d1ngd0/kla"
  version "0.7.1"
  url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"
  sha256 "92723fbf8fa7b2c35ad03bb3db1b47fad3fd80e8e4a7f07e57ad53a7b6d8c91d"

  def install
    # Rename the downloaded binary to just "kla"
    bin.install Dir["kla-*"].first => "kla"
  end

  def caveats
    <<~EOS
      If this is a fresh install run `kla init` to create a new config file
    EOS
  end

  test do
    system "#{bin}/kla", "--help"
  end
end
