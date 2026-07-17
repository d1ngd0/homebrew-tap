class Kla < Formula
  desc "An HTTP CLI application for working with restful endpoints"
  homepage "https://github.com/d1ngd0/kla"
  sha256 "04d1aeb9b556a42aa2ed5344860fcde161b687c1a8490aa65b56fb40bd1f1eea"
  version "0.5.0"
  url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"
      sha256 "4ed4c44cee3c7e5cfbbe4c08f4bd82f0c62c7583c8951d478d0029d25b799811"
    else
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-x86_64-apple-#{version}"
      sha256 "de52f8f68bb924b0e1d2a6db5e93a7e3e134f2bcdadd886f787f2aa48675f278"
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
