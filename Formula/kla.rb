class Kla < Formula
  desc "An HTTP CLI application for working with restful endpoints"
  homepage "https://github.com/d1ngd0/kla"
  url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"
  sha256 "hash_for_arm"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"
      sha256 "hash_for_arm"
    else
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-x86_64-apple-#{version}"
      sha256 "hash_for_intel"
    end
  end

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
