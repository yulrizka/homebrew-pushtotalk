class Pushtotalk < Formula
  desc "OSX PushToTalk mutes and unmutes the microphone via a keypress"
  homepage "https://github.com/yulrizka/osx-push-to-talk"
  url "https://github.com/yulrizka/osx-push-to-talk/archive/v0.1.4.tar.gz"
  version "0.1.4"
  sha256 "7b86e77e765bd9699d33310addc10c75fe5bc01784a5e5c919ca674631579a35"
  license "MIT"

  depends_on xcode: :build

  def install
    xcodebuild "-project", "PushToTalk.xcodeproj",
      "CODE_SIGN_IDENTITY=-", "-configuration", "Release", "SYMROOT=build"
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
    assert FileTest.exists?("#{prefix}/PushToTalk.app")
  end
end
