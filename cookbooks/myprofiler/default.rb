github_binary 'myprofiler' do
  repository 'KLab/myprofiler'
  version '0.2'
  archive "myprofiler.#{node[:os]}_amd64.tar.gz"
end
