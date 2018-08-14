#build-script for mac

#xcode CLI
echo "Checking Xcode CLI tools"
# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Xcode CLI tools not found. Installing them..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD";
  softwareupdate -l;
  softwareupdate -i -a;
else
  echo "Xcode CLI tools OK"
fi

#homebrew
echo "installing home brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

echo "installing cakebrew and taps"
brew install Caskroom/cask/cakebrew;
brew tap caskroom/cask;
brew install caskroom/cask/brew-cask;
brew tap caskroom/versions;
brew cask install cakebrew;

#apps
echo "installing node"
brew install node;
echo "installing java"
brew cask install java;
java -version;
javac -version;

echo "installing git & setting up config"
brew install git;
git --version;

printf "Enter Git Global username" 
read username
printf "Enter Git Global email" 
read email

git config --global user.name $username;
git config --global user.email $email;

echo "installing openssl"
brew install openssl;
echo "installing maven"
brew install maven;
echo "installing gradle"
brew install gradle;
echo "installing wget"
brew install wget;
echo "installing jenv & config"
brew install jenv;
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc;
echo 'eval "$(jenv init -)"' >> ~/.zshrc;

#utils
echo "installing iTerm2"
brew cask install iterm2;
echo "installing zsh-completions"
brew install zsh zsh-completions;
echo "installing sourcetree"
brew cask install sourcetree;
echo "installing Chrome"
brew cask install google-chrome;
echo "installing adobe reader"
brew cask install adobe-acrobat-reader;
echo "installing the-unarchiver"
brew cask install the-unarchiver;
echo "installing aerial"
brew cask install aerial;
echo "installing vlc"
brew cask install vlc;
echo "installing flux"
brew cask install flux;
echo "installing postman"
brew cask install postman;
echo "installing staruml"
brew cask install staruml;
echo "installing jetbrains-toolbox"
brew cask install jetbrains-toolbox;
echo "installing slack"
brew cask install slack;
echo "installing skype"
brew cask install skype;
echo "installing sourcetree"
brew cask install sourcetree;
echo "installing whatsapp"
brew cask install whatsapp;
echo "installing visual-studio"
brew cask install visual-studio;
echo "installing dashlane"
brew cask install dashlane;
echo "installing tunnelblick"
brew cask install tunnelblick;
echo "installing atom"
brew cask install atom;
echo "installing visual-studio-code"
brew cask install visual-studio-code;
echo "installing sublime-text"
brew cask install sublime-text;
echo "installing webstorm"
brew cask install webstorm;
echo "installing eclipse-ide"
brew cask install eclipse-ide;
echo "installing intellij-idea"
brew cask install intellij-idea;
echo "installing android-studio"
brew cask install android-studio;
echo "installing gulp"
brew cask install gulp;
echo "installing xamarin-studio"
brew cask install xamarin-studio;
echo "installing docker"
brew install docker;
echo "installing kitematic"
brew cask install kitematic;
echo "installing spotify"
brew cask install spotify;

# cleanup
echo "Cleaning Up Home brew"
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
