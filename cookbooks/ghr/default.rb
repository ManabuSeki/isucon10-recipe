github_binary 'ghr' do
    repository 'tcnksm/ghr'
    version 'v0.12.0'
    archive "ghr_#{version}_#{node[:os]}_amd64.zip"
end
