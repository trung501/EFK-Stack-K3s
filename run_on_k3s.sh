## Common namespace
kubectl create -f ./common/kube-logging.yaml

## ES
kubectl create -f ./elastic-search/elastic-service.yaml
envsubst < ./elastic-search/elastic-statefulset.yaml | kubectl create -f -

## Kibana
envsubst < ./kibana/kibana.yml | kubectl create -f -

## Fluent bit
envsubst < ./fluent-bit/fluent-bit-service-account.yml | kubectl create -f -
envsubst < ./fluent-bit/fluent-bit-role.yml | kubectl create -f -
envsubst < ./fluent-bit/fluent-bit-role-binding.yml | kubectl create -f -
envsubst < ./fluent-bit/fluent-bit-configmap.yml | kubectl create -f -
envsubst < ./fluent-bit/fluent-bit-ds-minikube.yml | kubectl create -f -
