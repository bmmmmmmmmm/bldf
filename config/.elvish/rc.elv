#( •̀ ω •́ )✧
set paths = [
      ~/.npm-global/bin
      ~/.cargo/bin
      ~/.local/bin
      ~/.deno/bin
      /bin
      /usr/bin
      $@paths
    ]

set E:RUSTUP_DIST_SERVER = "https://rsproxy.cn"
set E:RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"
set E:CARGO_HTTP_MULTIPLEXING = "false"
set E:LESSCHARSET = "utf-8"
set E:EDITOR = "nvim"
#set E:HTTP_PROXY = "http://127.0.0.1:8889"
#set E:HTTPS_PROXY = "https://127.0.0.1:8889"


fn l {|| e:exa -la}
fn c {|| clear }
fn s {|| e:neofetch}
fn cb {|| cd ../}
fn cbb {|| cd ../../ }
fn cbbb {|| cd ../../../ }
fn cbbbb {|| cd ../../../../ }

fn bd {|| bat ~/.elvish/rc.elv}

fn lg {|| e:lazygit}

# dictionary jump
fn cdn {|| cd ~/Nyx}
fn cdp {|| cd ../}

# dotfile
fn e {|@a| nvim $@a}
fn nas {|| bash ~/Nyx/apply-system.sh }
fn nes {|| nvim ~/Nyx/system/configuration.nix }
fn erc {|| nvim ~/.elvish/rc.elv}
fn exm {|| nvim ~/.xmonad/xmonad.hs}
fn envimrc {|| nvim ~/.config/nvim/entry.vim}

# git
# postfix:
# d => directly,
# s => specific,
# a => all,
# f => force,
# i => interactive / index,
# n => new
# 

fn gitconfiginit {||
  git config user.name "blurname"
  git config user.email "naughtybao@outlook.com"
  git config credential.helper store
}

fn gwip {|| 
  git add .
  git commit -m "--wip-- [skip ci]" -n
} 
fn gcm {|commitMessage| git commit -am $commitMessage}
fn gcl {|repoName| git clone 'https://github.com/'$repoName}

fn gpsd {|| git push}
fn gpsf {|| git push --force}
fn gpsn {||
  var name = (git branch --show-current)
  put $name
  git push --set-upstream origin $name
}

fn gpla {|| git pull}
fn gpls {|remoteBranch| git pull origin/$remoteBranch $remoteBranch}

fn grhh {|| git reset --hard HEAD~}
fn grhc {|hashId| git reset --hard $hashId}
fn grhr {|remote| git reset --hard $remote }
fn grsh {|| git reset --soft HEAD~}

fn gssd {|| git stash save}
fn gssn {|stashName| git stash save $stashName}
fn gsl {|| git stash list}
fn gsad {|| git stash apply}
fn gsai {|index| git stash apply $index}

fn gl {|| git log --pretty=format:"%Cred%h %C(yellow)%ad %Cgreen[%an] %Cblue%s %Cred%d" --date=short}
fn gd {|| git diff}
fn gs {|| git status}

fn gf {|| git fetch}
fn gfs {|branch| git fetch origin $branch}
fn gco {|a| git checkout $a}
fn gcob {|a| git checkout -b $a}
fn gcor {|a| git checkout -b $a origin/$a}
fn gcot {|a| git checkout --track $a}
fn gbl {|| git branch}
fn gbla {|| git branch -a}
fn gbd {|a| git branch --delete --force $a}

fn gri {|a| git rebase -i $a}
fn gra {|| git rebase --abort}
fn grc {|| git rebase --continue}
fn gcpi {|a| git cherry-pick $a}
fn gcpa {|| git cherry-pick --abort}
fn gcpc {|| git cherry-pick --continue}
fn gtore {|| git credential.helper store}


# docker
fn dcla {||docker ps -a}
fn dcls {||docker ps}

# npm 
fn ni {|| npm i}
fn nkp {|a| npx kill-port $a}

# script
fn mksh {|a|
	touch $a.sh
	chmod 764 $a.sh
  nvim $a.sh
}
fn mkelv {|a|
	touch $a.elv
	chmod 764 $a
  nvim $a.elv
}

# deno
fn drw {|path| deno run --watch $path }
fn draa {|path| deno run --allow-all $path}

fn mockupdate {|| bash ~/iupdate.sh}

# bindings
set edit:insert:binding[Alt-w] = $edit:insert:binding[Alt-f]
set edit:insert:binding[Alt-h] = $edit:insert:binding[Home]
set edit:insert:binding[Alt-l] = $edit:insert:binding[End]

eval (starship init elvish) 2> /dev/null
