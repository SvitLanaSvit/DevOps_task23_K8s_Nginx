#!/bin/bash

# Перевірити, чи існує кластер
if ! kind get clusters | grep -q nginx-cluster; then
  kind create cluster --name nginx-cluster --config kind-config.yaml
fi

# Чекати, поки serviceaccount "default" не з'явиться
echo "Очікування готовності serviceaccount 'default'..."
until kubectl get serviceaccount default &> /dev/null
do
  sleep 2
done

kubectl apply -f nginx-pod.yaml
kubectl apply -f nginx-service.yaml

# Вивести інформацію для доступу
echo "Доступ до Nginx за адресою: http://localhost:8080"