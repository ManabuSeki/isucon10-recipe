package 'zsh'

if node[:platform] != 'darwin'
  execute "chsh -s /bin/zsh #{node[:user]}" do
    only_if "getent passwd #{node[:user]} | cut -d: -f7 | grep -q '^/bin/bash$'"
    user 'root'
  end
  dotfile '.zshrc.Linux'
end

execute 'Install oh-my-zsh' do
  user node[:user]
  command 'sh -c "$(curl -fsSL https://gitlab.zitaku.net/gaku/dotfiles/raw/master/tool/oh-my-zsh.sh)"'
  not_if "test -e ~/.oh-my-zsh"
end

execute 'Install zsh-autosuggestions' do
  user node[:user]
  command <<-EOC
  git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  EOC

  not_if 'test -e $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions'
end

execute 'Install zsh-syntax-highlighting' do
  user node[:user]
  command <<-EOC
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  EOC

  not_if 'test -e $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'
end

execute 'Remove default .zshrc' do
  user node[:user]
  command 'rm -f $HOME/.zshrc'
  only_if 'test -e $HOME/.zshrc'
end

dotfile '.zsh'
dotfile '.zshrc'
