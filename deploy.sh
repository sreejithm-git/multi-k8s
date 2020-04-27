docker build -t sreejith1/multi-client -f client/Dockerfile ./client
docker build -t sreejith1/multi-server -f server/Dockerfile ./server
docker build -t sreejith1/multi-worker -f worker/Dockerfile ./worker

docker push sreejith1/multi-client
docker push sreejith1/multi-server
docker push sreejith1/multi-worker

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sreejith1/multi-server
