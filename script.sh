
babylond init $MONIKER --chain-id bbn-test-1
# wget https://github.com/babylonchain/networks/blob/main/bbn-test1/genesis.tar.bz2
# tar -xjf genesis.tar.bz2 && rm genesis.tar.bz2
wget https://raw.githubusercontent.com/demondvn/babylon-node/main/genesis.json -O ~/.babylond/config/genesis.json

wget -O $HOME/.babylond/config/addrbook.json "https://snapshots-testnet.nodejumper.io/babylon-testnet/addrbook.json"

external_address=$(wget -qO- eth0.me)
sed -i.bak -e "s/^external_address *=.*/external_address = \"$external_address:26656\"/" $HOME/.babylond/config/config.toml

sed -i.bak -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.0025ubbn\"/;" ~/.babylond/config/app.toml

PEERS="88bed747abef320552d84d02947d0dd2b6d9c71c@babylon-testnet.nodejumper.io:44656,e4b3430b25eee1b46d5f9289b12eccdb6308b10b@168.119.124.130:30656,a4f76dddb6bdb195a0e49be82a3fd789d98631df@65.109.85.170:55656,af6104a6cc151aa645f933ea28cba1d5b0f7dbfd@213.239.216.252:41656,2c06e6d7ae970824dd3da1ac352c6f2fa6bb9f4b@38.242.241.126:26656,c48276582fbd884a57bd481d2b5c1503c7b73e92@54.224.66.12:26656,b531acac8945962606025db892d86bb0bf0872af@3.93.71.208:26656,ed9df3c70f5905307867d4817b95a1839fdf1655@154.53.56.176:27656,cd9d96f554e7298a8d1f1a94489f7a51520f01ff@142.132.152.46:47656,e3f9ccbfc86011bb2bd6c2756b2c8b8dc4c8eb97@54.81.138.3:26656,d54157138c8b26d8eabf4b0d9e01b2b5d9e38267@54.234.206.250:26656,617b10a9ea1c97b8230ccb70e1fb4ecef1b46601@18.212.224.149:26656,b53302c8887d4bd57799992592a2280987d3f213@95.217.144.107:20656,1400847b76e57c13e49ff1bfbcce7e71865dde7f@65.109.92.240:17896,ad3684076dc5c514bd4ba847203b2c1900d48ead@82.65.197.168:26656,a5fabac19c732bf7d814cf22e7ffc23113dc9606@34.238.169.221:26656,ca7bffa119704c7666a7ae10e7d17e5a2f857071@65.109.106.179:20656,03ce5e1b5be3c9a81517d415f65378943996c864@18.207.168.204:26656,1d0c78d6945ac4007dafef2a130e532c07b806d2@65.108.105.48:20656,01e9880fa946a378b2cd6a0432525812c295333e@89.58.59.75:60556,539bbebeb0d13ac22db640b102235f7e4f00856d@104.244.208.243:20656,42dd05c43fa9e51cfabc6a2ab0afa9044b123cc6@34.201.34.29:26656,b4ccb4af8c4e226e5844065197dfbe013690758b@65.108.233.220:14656,f136d7e7788c8e9c9c4784703f158029ffdb70b5@65.108.200.248:55706,5fd378bc1490dfd582fb6d32de3c02e743047811@195.14.6.2:26656,b10105846b4f9086b9f9245df4841a4bb7c6ba7b@65.108.197.169:14656,b15e490bcad4f02ad66c50ccd5dc5fa9c4006bcc@65.109.93.58:44656,ae5b89a8f1934e45ad3698671005a56623f04111@213.239.207.165:29056,c1406917c620090ae59f7301c7b3c9d1864d91cb@85.10.192.146:26656,5c2a752c9b1952dbed075c56c600c3a79b58c395@195.3.220.135:27116"
sed -i 's|^persistent_peers *=.*|persistent_peers = "'$PEERS'"|' $HOME/.babylond/config/config.toml

SEEDS="03ce5e1b5be3c9a81517d415f65378943996c864@18.207.168.204:26656,a5fabac19c732bf7d814cf22e7ffc23113dc9606@34.238.169.221:26656"
sed -i.bak -e "s/^seeds =.*/seeds = \"$SEEDS\"/" $HOME/.babylond/config/config.toml

pruning="custom"
pruning_keep_recent="1000"
pruning_interval="10"
sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $HOME/.babylond/config/app.toml
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $HOME/.babylond/config/app.toml
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $HOME/.babylond/config/app.toml
