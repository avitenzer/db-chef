execute 'multichain_d' do
  command "multichaind #{node["blockchain"]["name"]}@#{node["blockchain"]["ip"]}:#{node["blockchain"]["port"]} -daemon"
end