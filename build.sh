git reset --hard
git pull

docker-compose down --remove-orphans

cd admin

docker build -t churchapp_tpac_admin .

cd ..

docker-compose up -d
