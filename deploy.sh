echo 'Creating Networks'
docker network create tp-project
docker network ls

echo 'Mongo Container'
docker run --name mongodb -v $(pwd)/database-data:/data/db --restart=always -d --network tp-project mongo

echo 'BE Image and Container'
cd BE

echo 'Docker BE build'
docker build -t be .

echo 'BE container'
docker run --name be-container --restart=always -d -p 8081:8081 --network tp-project be

echo 'FE Image and Container'
cd ..

cd FE

echo 'Docker FE build'
docker build -t fe .

echo 'FE container'
docker run --name fe-container --network tp-project --restart=always -d -p 3000:3000 -it fe

echo 'verify images'
docker images

echo 'Verify Containers'
docker ps
