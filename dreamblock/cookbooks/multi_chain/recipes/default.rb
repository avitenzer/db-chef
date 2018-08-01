execute 'extract_tar' do
  command "tar xzvf #{node["software"]["directory"]}multichain-1.0.5.tar.gz -C #{node["software"]["directory"]}"
  
  not_if { File.exists?("#{node["software"]["directory"]}multichain-1.0.5") }
end

execute 'move_multichaind' do
  command "mv #{node["software"]["directory"]}multichain-1.0.5/multichaind /usr/local/bin"
  not_if { File.exists?("/usr/local/bin/multichaind") }
end

execute 'move_multichain_cli' do
  command "mv #{node["software"]["directory"]}multichain-1.0.5/multichain-cli /usr/local/bin"
  not_if { File.exists?("/usr/local/bin/multichain-cli") }
end

execute 'move_multichain_util' do
  command "mv #{node["software"]["directory"]}multichain-1.0.5/multichain-util /usr/local/bin"
  not_if { File.exists?("/usr/local/bin/multichain-util") }
end

execute 'move_multichain_cold' do
  command "mv #{node["software"]["directory"]}multichain-1.0.5/multichaind-cold /usr/local/bin"
  not_if { File.exists?("/usr/local/bin/multichaind-cold") }
end

execute 'clean_up' do
  command "rm -Rf #{node["software"]["directory"]}multichain-1.0.5"
end

execute 'foo' do
  command "multichaind #{node["blockchain"]["name"]}@#{node["blockchain"]["ip"]}:#{node["blockchain"]["port"]} -daemon"
end

 



