execute 'multichain_d' do
  command "/apps/multichaind -datadir=#{node['app']['directory']}#{node['data']['directory']} #{node["blockchain"]["name"]}@#{node["blockchain"]["ip"]}:#{node["blockchain"]["port"]} -daemon"
end