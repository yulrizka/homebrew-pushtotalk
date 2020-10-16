class Pushtotalk < Formula
  desc "OSX PushToTalk mutes and unmutes the microphone via a keypress."
  homepage "https://github.com/yulrizka/osx-push-to-talk"
  url "https://github.com/yulrizka/osx-push-to-talk/archive/v0.1.3.tar.gz"
  version "v0.1.3"
  sha256 "1365f2ee7c52ca6ab88fb6d54fb364b879e85738ef1ab5b8b689b5463795c103"
  license "MIT"

  depends_on xcode: :build

  def install
    xcodebuild "-project", "PushToTalk.xcodeproj", "CODE_SIGN_IDENTITY="
    prefix.install "build/Release/PushToTalk.app"
  end

  def caveats
    installed_path = "#{prefix}/PushToTalk.app"
    <<~EOS
      The application was only built in "#{installed_path}"

      To make it available in the Application folder, create a symlink with:

          ln -s "#{installed_path}" "/Applications/PushToTalk.app"

    EOS
  end

  test do
  end
end
