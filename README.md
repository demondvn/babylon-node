# babylon-node

    docker build . -t babylon
    docker run -d --name babylon -e MONIKER=MonPham -e xxx.xxx.xxx.xxx:26656 -v /mnt/blockstore/babylon:/root/.babylond/ babylon
