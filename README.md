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

#Описание приложения#

Приложение состоит из:
- сервер авторизации keycloak
- сервер ресурсов java springboot rest (с использованием redis для кэширование ~~запросов~~ пока только одного запроса)
- клиентское приложение на vue.js

Приложение представляет собой простой rest сервис библиотеки, с разделением ролей admin/user и проверкой с помощью jwt.
Пользователи с ролью admin могут добавлять книги в библиотеку, редактировать, удалять, получать информацию (например, кто взял книгу),
т.е. стандартные CDUD операции. 
Пользователи с ролью user могут просмотреть список книг и взять/вернуть книгу

Чтобы запустить в тестовом режиме и не создавать руками настройки и юзеров в keycloak, можно накатить дамп бд,
который соответствует настройкам keycloack в spring приложении.
Для этого нужно дождаться пока поднимутся все контейнеры в докере ( проверить что keycloak в браузере работает)
и запустить последовательно следующие команды в терминале

***копирует дамп в контейнер***
```
docker cp keycloak_db.sql keycloak-db:/
```
***вход в контейнер***
```
docker exec -it keycloak-db bash
```
***накатить дамп***
```
mysql -u'root' -p'root' keycloak_db < keycloak_db.sql
```
***выйти из контейнера***
```
exit
```

должны появиться
- admin ( с правами ADMIN и USER)

- user (USER)

в keycloak включена регистрация, новые юзеры создаются с ролью USER

Приложение будет работать только с дампом sql в бд keycloak, 
без дампа нужно сконфигурировать keycloak заново и прописать актуальные настройки в application.properties приложения
spring boot и в приложении vue.

Пример запуска
```bash start.sh dbname dbpassword keykloakname keykloakpassword```

- Приложение Spring будет работать по адресу localhost:8080
- Доступна документация API по адресу localhost:8080/swagger-ui.html

>Для защищенных руотов нужно получить токен, чтобы запрос прошёл. т.к. сервер авторизации - это
другое приложение, его роуты не включены в эту страницу. 
для получения токена, например, через postman, следует выполнить post запрос на адрес
http://localhost:8082/auth/realms/my_realm/protocol/openid-connect/token
со следующими параметрами в body:
> - client_id: my_client
> - grant_type: password
> - scope: openid
> - username: ${имя}
> - password: ${пароль}

- Сервер авторизации localhost:8082
- Приложение vue localhost:8081
- Подробнее см конфигурацию docker-compose

