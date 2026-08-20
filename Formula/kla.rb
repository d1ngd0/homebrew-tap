class Kla < Formula
  desc "An HTTP CLI application for working with restful endpoints"
  homepage "https://github.com/d1ngd0/kla"
  version "0.6.0"
  url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"
  sha256 "879ab496edfb524afd9c9e3d8e404597626753c50dc3e97a330c11d8379bb080"

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
