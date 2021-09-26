echo 'Creating Networks'
docker network create tp-project
docker network ls

echo 'Mongo Container'
docker run --name mongodb \
	--network tp-project \
	-v $(pwd)/database-data:/data/db \
	-v $(pwd)/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js:ro \
	-e MONGO_INITDB_ROOT_USERNAME=root \
	-e MONGO_INITDB_ROOT_PASSWORD=secret \
	-e MONGO_INITDB_DATABASE=course-goals \
	--restart=always \
	-d mongo

echo 'BE Image and Container'
cd BE

echo 'Docker BE build'
docker build -t be .

echo 'BE container'
docker run --name be-container \
	--network tp-project \
	-e MONGO_HOST=root:secret@mongodb -e MONGO_DB=course-goals \
	-p 3000:8081 \
	--restart=always \
	-d be

echo 'FE Image and Container'
cd ..

cd FE

echo 'Docker FE build'
docker build -t fe . 

cd ..

echo 'FE container'
docker run --name fe-container \
	--network tp-project \
	-p 8081:3000 \
	--restart=always \
	-dit fe

echo 'verify images'
docker images

echo 'Verify Containers'
docker ps
