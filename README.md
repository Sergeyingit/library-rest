## Deployment
Deployment process as easy as possible:
Required software:
- terminal for running bash scripts
- docker
- docker-compose

to deploy application, switch to needed branch and run bash script:

```
$ bash start.sh
```
That's all.

Чтобы запустить в тестовом режиме и не создавать руками настройки и юзеров в keycloak, можно накатить дамп бд,
который соответствует настройкам keycloack в spring приложении.
Для этого нужно дождаться пока поднимутся все контейнеры в докере ( проверить что keycloak в браузере работает)
и запустить последовательно следующие команды в терминале

***копирует дамп в контейнер***
```
docker cp dev_keycloak_db.sql keycloak-db:/
```
***вход в контейнер***
```
docker exec -it keycloak-db bash
```
***накатить дамп***
```
mysql -u'root' -p'root' dev_keycloak_db < dev_keycloak_db.sql
```
***выйти из контейнера***
```
exit
```

должны появиться 3 юзера
admin ( с правами ADMIN и USER)
user (USER)
demo (USER)

юзер с правами ADMIN может добавлять книги в библиотеку.
юзеры с правами USER могут только добавлять/удалять из своей коллекции