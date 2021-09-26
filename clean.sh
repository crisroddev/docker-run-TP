echo 'Cleaning'

echo 'Cleaning Container'
docker rm -f be-container fe-container mongodb

echo 'Cleaning Images'
docker rmi mongo be fe

echo 'Cleaning Networks'
docker network rm tp-project
