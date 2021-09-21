echo 'Cleaning'

echo 'Cleaning Networks'
docker network rm tp-project

echo 'Cleaning Container'
docker stop be-container fe-container mongodb

echo 'Cleaning Images'
docker rmi mongo be fe