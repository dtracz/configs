
curent_dir=`pwd`
cd `dirname $0`

cp vimrc $HOME/.vimrc
cp tmux.conf $HOME/.tmux.conf
cp -r konsole $HOME/.local/share/

cd $curent_dir

