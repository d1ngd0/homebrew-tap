class Kla < Formula
  desc "An HTTP CLI application for working with restful endpoints"
  homepage "https://github.com/d1ngd0/kla"
  sha256 "622be7aebcd72a4acafcfb7c7d8a6dee36f88c25c6ce1fd9058ee98c4b6237a4"
  version "0.5.2"
  url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-aarch64-apple-#{version}"
      sha256 "622be7aebcd72a4acafcfb7c7d8a6dee36f88c25c6ce1fd9058ee98c4b6237a4"
    else
      url "https://github.com/d1ngd0/kla/releases/download/#{version}/kla-x86_64-apple-#{version}"
      sha256 "ecd001d9489fb4926df3544011adf6377d820fd712ad406193407a4ace1eb182"
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
