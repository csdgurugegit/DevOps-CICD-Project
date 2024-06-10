CHART_VERSION="4.10.0"
APP_VERSION="1.10.0"

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm search repo ingress-nginx --versions

mkdir /home/scripts/manifests/helm/nginx-ingress

helm template ingress-nginx ingress-nginx \
--repo https://kubernetes.github.io/ingress-nginx \
--version ${CHART_VERSION} \
--namespace ingress-nginx \
> /home/scripts/manifests/helm/nginx-ingress/nginx-ingress.${APP_VERSION}.yaml

kubectl create namespace ingress-nginx
kubectl apply -f /home/scripts/manifests/helm/nginx-ingress/nginx-ingress.${APP_VERSION}.yaml