class Kla < Formula
  desc "An HTTP CLI application for working with restful endpoints"
  homepage "https://github.com/d1ngd0/kla"
  sha256 "04d1aeb9b556a42aa2ed5344860fcde161b687c1a8490aa65b56fb40bd1f1eea"
  version "0.4.3"
  url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"
      sha256 "04d1aeb9b556a42aa2ed5344860fcde161b687c1a8490aa65b56fb40bd1f1eea"
    else
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-x86_64-apple-#{version}"
      sha256 "c438a40b079e27c8046e8ff3d06c54a02053f19a6998f5b9a402190b8cfbda6b"
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
