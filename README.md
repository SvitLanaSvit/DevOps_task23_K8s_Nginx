# Kubernetes Homework

## Основна інформація про проєкт

Цей проєкт демонструє базову роботу з Kubernetes у локальному середовищі (WSL2 + kind):
- Створення кластера Kubernetes за допомогою kind
- Деплой pod з nginx
- Відкриття доступу до nginx через Service
- Автоматизація деплою через bash-скрипт

## Інсталяція KIND у WSL2

Детальна інструкція з встановлення KIND у WSL2 знаходиться тут: [docs/kind-windows-wsl2.md](docs/kind-windows-wsl2.md)

## Опис структури проєкту

Детальний опис структури проєкту та призначення основних файлів: [docs/project-structure.md](docs/project-structure.md)

---

## Приклад виконання скрипта

![deploy.sh execution example](screens/1_deploy.png)

## Скріншот результату запуску у WSL

![deploy.sh WSL result](screens/1.2_deploy_wsl_result.png)

---

## Перевірка після деплою

> **kubectl get pods / get services:**
>
> ![kubectl get pods/services](screens/1.3_get_pods_get_services.png)

> **kubectl describe pod nginx-pod:**
>
> ![kubectl describe pod nginx-pod](screens/1.4_describe_pod.png)

> **kubectl describe service nginx-service:**
>
> ![kubectl describe service nginx-service](screens/1.5_describe_service.png)

---

## Додатково: port-forward для доступу до nginx

У середовищі Windows + WSL2 + kind port-forward — це стандартний і рекомендований спосіб отримати доступ до сервісів у кластері.

Виконайте у WSL:
```bash
kubectl port-forward pod/nginx-pod 8080:80
```

- Ця команда відкриє локальний порт 8080 і направить трафік напряму у pod на порт 80.
- Після запуску port-forward не закривайте це вікно терміналу.

В іншому вікні WSL перевірте доступність nginx:
```bash
curl http://localhost:8080
```

Якщо ви побачите HTML-код сторінки nginx — все працює!

---

## Важливо про port-forward у WSL2 + kind

> **ВАЖЛИВИЙ МОМЕНТ (професійний):**
>
> `kubectl port-forward` — це не “обхідний шлях”, а стандартний, рекомендований інструмент для локальної розробки з Kubernetes.
>
> Його активно використовують DevOps, SRE, Kubernetes maintainers і він описаний у офіційній документації Kubernetes.
>
> **Приклад виконання port-forward:**
>
> ![kubectl port-forward example](screens/2_port_forward.png)
>
> **У випадку Windows + WSL2 + kind:**
> - port-forward — це єдиний правильний, стабільний і очікуваний варіант доступу до сервісів у кластері.
> - У середовищі Windows + WSL2 VM не має bridge IP, тому прямий доступ до NodePort/ClusterIP з Windows неможливий.
> - Доступ до pod/service можливий лише через `kubectl port-forward`.

---

## Результати: доступ до nginx

> **Скріншот сторінки nginx у браузері:**
>
> ![nginx in browser](screens/3.1_nginx_windows_result.png)

> **Скріншот перевірки через curl у WSL:**
>
> ![nginx curl WSL](screens/3.2_nginx_wsl_result.png)

---

## Видалення кластера kind

Після завершення роботи кластер можна видалити для звільнення ресурсів:

Виконайте у WSL:
```bash
kind delete cluster --name nginx-cluster
```

> **Скріншот видалення кластера:**
>
> ![kind delete cluster](screens/4_delete_cluster.png)

---


