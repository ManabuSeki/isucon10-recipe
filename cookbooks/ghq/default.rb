github_binary 'ghq' do
  repository 'motemen/ghq'
  version 'v1.1.5'
  archive "ghq_#{node[:os]}_amd64.zip"
end

