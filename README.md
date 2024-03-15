# All my dotfiles in this repository.




## Installing dotfiles onto a new system:


  ### *Manualy*

  Add this to .bashrc or .zsh:
  ```bash
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  ```

  To avoid recursion problems add this:
  ```bash
  echo ".cfg" >> .gitignore
  ```

  Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME::
  ```bash
  git clone --bare git@github.com:ShArpNo/cfg.git $HOME/.cfg
  ```
  
  Define the alias in the current shell scope:
  ```bash
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  ```

  Checkout the actual content from the bare repository to your $HOME:
  ```bash
  config checkout
  ```
  
  The step above might fail with a message like:
  ```bash
    error: The following untracked working tree files would be overwritten by checkout:
      .bashrc
      .gitignore
  Please move or remove them before you can switch branches.
  Aborting
  ```

  This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git.  
  The solution is simple: back up the files if you care about them, remove them if you don't care.  
  I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:
  mkdir -p .config-backup && \
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
  xargs -I{} mv {} .config-backup/{}
  
  Re-run the check out if you had problems:
  ```bash
  config checkout
  ```
  
  Set the flag showUntrackedFiles to no on this specific (local) repository:
  """bash
  config config --local status.showUntrackedFiles no
  """
  
