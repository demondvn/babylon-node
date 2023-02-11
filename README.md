# babylon-node

    docker build . -t babylon
    docker run -d --name babylon -e MONIKER=MonPham -v /mnt/blockstore/babylon:/root/.babylond/ babylon
