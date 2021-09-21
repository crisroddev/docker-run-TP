__Networks__
docker network create tp-project

__Mongo Docker__
docker run --name mongodb -v data:/data/db --rm -d --network tp-project mongo

__BE__
docker build -t be .
docker run --name be-container --rm -d -p 8081:8081 --network tp-project be

__FE__
docker build -t fe .
docker run --name fe-container --network tp-project --rm -d -p 3000:3000 -it fe
