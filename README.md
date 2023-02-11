# babylon-node

    docker build . -t babylon
## Run
    docker run -d --name babylon -p 26656:26656 -e MONIKER=MonPham -v /mnt/blockstore/babylon:/root/.babylond/ babylon
