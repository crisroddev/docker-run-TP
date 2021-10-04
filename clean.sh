echo 'Cleaning'

echo 'Stop Container'
docker stop be-container fe-container mongodb

echo 'Cleaning Container'
docker rm be-container fe-container mongodb

echo 'Cleaning Images'
docker rmi mongo:5.0.3-focal be fe

echo 'Cleaning Networks'
docker network rm tp-project
