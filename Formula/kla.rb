class Kla < Formula
  desc "An HTTP CLI application for working with restful endpoints"
  homepage "https://github.com/d1ngd0/kla"
  sha256 "04d1aeb9b556a42aa2ed5344860fcde161b687c1a8490aa65b56fb40bd1f1eea"
  version "0.5.1"
  url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"
      sha256 "b4af08cd7726d01e084e272e311a01d61051093d0446aff77d01516dedf2558b"
    else
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-x86_64-apple-#{version}"
      sha256 "8d8b5ce33f818978057a04f14072b32f98acb9ffc9375a815d1e15e96054c006"
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
