bash 'create_blockchain' do
  code <<-EOH
    /usr/local/bin/multichain-util create #{node["blockchain"]["name"]}
    /usr/local/bin/multichaind #{node["blockchain"]["name"]} -daemon
  EOH
end

#to connect to the chain in interactive mode run
#sudo /usr/local/bin/multichain-cli chain-name