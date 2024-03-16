#!/usr/bin/env bash
git clone --bare git@github.com:ShArpNo/cfg.git $HOME/.cfg
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

function config {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
config checkout
if [ $? -ne 0 ]; then
  echo "Backing up previous config...";
  mkdir -p .config-backup && config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
else
  echo "No config found.";
fi;
config checkout
config config --local status.showUntrackedFiles no

echo "Done.\n"
