powershell_script 'initiate_new_chain' do
  code <<-EOH
    multichaind -datadir=#{node['app']['directory']}#{node['data']['directory']} #{node["blockchain"]["name"]}@#{node["blockchain"]["ip"]}:#{node["blockchain"]["port"]} -daemon > #{node['app']['directory']}#{node['data']['directory']}/logs.txt
  EOH
end