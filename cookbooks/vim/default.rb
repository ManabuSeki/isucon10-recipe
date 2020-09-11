case node[:platform]
when 'debian', 'ubuntu'
  package 'vim-gtk3'
  package 'python3-pip'
  execute 'ubuntu neovim' do
    user node[:user]
    command  <<-EOC
    pip3 install --upgrade neovim
    EOC
  end
when 'redhat'
  package 'vim'
else
  package 'vim'
end
