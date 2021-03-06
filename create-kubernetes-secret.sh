#!/usr/bin/env bash

# if [[ $(kubectl get secrets -n openfaas-fn | grep secret-api-test-key | wc -l) -eq 0 ]]
# then
#     echo $SECRET | kubectl create secret generic secret-api-test-key --namespace openfaas-fn
#     echo "Kubernetes secret created"
# else
#     echo "Kubernetes secret already exists. Removing old secret secret-api-test-key form openfaas-fn"
#     kubectl delete secret secret-api-test-key -n openfaas-fn
#     echo $SECRET | kubectl create secret generic secret-api-test-key --namespace openfaas-fn
#     echo "Kubernetes secret created"
# fi 

(kubectl delete secret secret-api-test-key -n openfaas-fn && sleep 1 ) || :
kubectl create secret generic secret-api-test-key --from-literal secret-api-test-key="$SECRET" --namespace openfaas-fn


