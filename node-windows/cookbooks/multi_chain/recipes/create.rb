powershell_script 'create_chain' do
  code <<-EOH
    multichain-util create -datadir="#{node['app']['directory']}/#{node['data']['directory']}" #{node['blockchain']['name']}
  EOH
end

#we can replace that and add the parameters to the command line
=begin
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
=end

bash 'initiate_new_chain' do
  code <<-EOH
    multichaind #{node["blockchain"]["name"]} -daemon
  EOH
end

#to connect to the chain in interactive mode run
#multichain-cli chain-name