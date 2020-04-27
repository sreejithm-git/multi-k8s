docker build -t sreejith1/multi-client:latest -t sreejith1/multi-client:$SHA -f client/Dockerfile ./client
docker build -t sreejith1/multi-server:latest -t sreejith1/multi-server:$SHA -f server/Dockerfile ./server
docker build -t sreejith1/multi-worker:latest -t sreejith1/multi-worker:$SHA -f worker/Dockerfile ./worker

docker push sreejith1/multi-client:latest
docker push sreejith1/multi-server:latest
docker push sreejith1/multi-worker:latest

docker push sreejith1/multi-client:$SHA
docker push sreejith1/multi-server:$SHA
docker push sreejith1/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sreejith1/multi-server:$SHA
kubectl set image deployments/client-deployment client=sreejith1/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=sreejith1/multi-worker:$SHA
