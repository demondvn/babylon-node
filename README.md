# babylon-node

    docker build . -t babylon
## Run
    docker run -d --name babylon -e MONIKER=MonPham -v /mnt/blockstore/babylon:/root/.babylond/ babylon
