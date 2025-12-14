# Опис структури проєкту

```
23_k8s/
├── docs/                  # Документація (інструкції, гайд по встановленню KIND)
│   └── kind-windows-wsl2.md
├── screens/               # Скріни виконання завдання
│   ├── 1_deploy.png                   # Скрин виконання deploy.sh
│   ├── 1.2_deploy_wsl_result.png      # Результат запуску deploy.sh у WSL
│   ├── 2_port-forward.png             # Виконання port-forward
│   ├── 3.1_nginx_windows_result.png   # Сторінка nginx у браузері Windows
│   ├── 3.2_nginx_wsl_result.png       # Перевірка nginx через curl у WSL
│   ├── 4_delete_cluster.png           # Видалення кластера kind
│   ├── 1.3_get_pods_get_services.png  # kubectl get pods/services
│   ├── 1.4_describe_pod.png           # kubectl describe pod nginx-pod
│   └── 1.5_describe_service.png       # kubectl describe service nginx-service
├── kind-config.yaml       # Конфігурація для створення кластера kind з пробросом портів
├── nginx-pod.yaml         # Маніфест Pod з nginx
├── nginx-service.yaml     # Маніфест Service для nginx
├── deploy.sh              # Bash-скрипт для автоматичного деплою pod та service
├── README.md              # Головний файл з описом проєкту та посиланням на документацію
└── task.txt               # Завдання
```

## Для чого потрібен deploy.sh

Файл `deploy.sh` — це bash-скрипт, який автоматизує:
- створення кластера kind (якщо його ще немає),
- очікування готовності serviceaccount,
- застосування маніфестів pod та service,
- вивід IP-адреси для доступу до nginx з браузера Windows.

Це дозволяє швидко та безпомилково розгорнути все необхідне для перевірки завдання.

### Важливо! Перед запуском deploy.sh потрібно надати йому права на виконання:
```bash
chmod +x deploy.sh
```
Після цього запускати скрипт так:
```bash
./deploy.sh
```

## Папка screens

У папці `screens` зберігаються скріншоти:
- виконання скрипта deploy.sh,
- результатів команд kubectl (get pods, get services),
- відкритої сторінки nginx у браузері,
- port-forward,
- видалення кластера.

Ці скріншоти потрібні для підтвердження виконання завдання згідно з вимогами.
