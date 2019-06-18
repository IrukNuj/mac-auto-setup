sudo apt update -y
sudo apt upgrade -y

touch ~/.bash_profile
echo "set bell-style none" >> ~/.inputrc
echo "set visualbell t_vb=" >> ~/.vimrc

sudo apt install gcc -y
sudo apt install g++ -y
sudo apt install make -y
sudo apt install autoconf -y
sudo apt install pkg-config -y

sudo apt install linuxbrew-wrapper

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

sudo mkdir -p /home/linuxbrew/.linuxbrew/var/homebrew/linked
sudo chown -R $(whoami) /home/linuxbrew/.linuxbrew/var/homebrew/linked

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

brew doctor

mkdir /mnt/c/Ubuntu
mkdir /mnt/c/Ubuntu/works
ln -s /mnt/c/Ubuntu/works/ ~/works

cd works
git clone https://github.com/IrukNuj/mac-auto-setup.git
https://github.com/IrukNuj/dotfile.git

cd
cp works/dotfile/.bashrc ~/.bashrc
cp works/dotfile/.bash_profile ~/.bash_profile
exec $SHELL -l