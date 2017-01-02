install_package() {
  sudo apt-get install $1;
}

install_ruby_install() {
  wget -O ruby-install-$1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
  tar -xzvf ruby-install-$1.tar.gz
  cd ruby-install-$1/
  sudo make install
  cd ..;
}

install_chruby() {
  wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
  tar -xzvf chruby-0.3.9.tar.gz
  cd chruby-0.3.9/
  sudo make install
  cd ..
}

install_package zsh;
install_package vim;
install_package tree;
install_package wget;
install_package python;
install_package python3;
install_package git;
install_package hub;
install_package tmux;
install_ruby_install 0.6.0;
install_package shellcheck;
install_chruby;


