bash 'create_blockchain' do
  code <<-EOH
    /usr/local/bin/multichain-util create #{node["blockchain"]["name"]}
    sudo rm ~/.multichain/#{node["blockchain"]["name"]}/params.dat
  EOH
end

template "#{node["home"]["directory"]}/.multichain/#{node["blockchain"]["name"]}/params.dat" do

  source "params.dat.erb"
  mode "644"
  owner "root"
  group "root"
  variables(
      :chain_name => node['blockchain']['name']
  )
  action :create_if_missing
end

bash 'initiate_new_chain' do
  code <<-EOH
    /usr/local/bin/multichaind #{node["blockchain"]["name"]} -daemon
  EOH
end

#to connect to the chain in interactive mode run
#sudo /usr/local/bin/multichain-cli chain-name