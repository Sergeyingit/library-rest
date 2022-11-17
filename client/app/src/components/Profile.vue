<template>
    <div class="container">
        <div class="row flex-column">
            <div>
                <h1>Личный кабинет читателя</h1>
                <alert :message="message" :status="status" v-if="showMessage"></alert>
                <div>
                    <h2>Личные данные</h2>
                    <p>id: {{user.id}}</p>
                    <p>Имя: {{user.username}}</p>
                </div>
                <div v-if="user.books.length > 0">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>
                                    Название
                                </th>
                                <th>
                                    Автор
                                </th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(book, index) in user.books" :key="index">
                                <td>
                                    {{ book.name }}
                                </td>
                                <td>
                                    {{ book.author }}
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-sm" @click="onDeleteBookFromUser(book)">Вернуть книгу</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div v-else>
                    <p>У вас нет книг.</p>
                    <p><a href="/books">Посмотреть список книг</a></p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
    import Alert from './Alert.vue';

    // axios.defaults.headers.common['Authorization'] = 'Bearer ' + token;

    export default {
        name: 'Profile',
        data() {
            return {
                user: {
                    id: '',
                    username: '',
                    books: [],
                },
                message: '',
                showMessage: false,
                status: '',
                userCurrent: JSON.parse(localStorage.getItem('userCurrent')),
                
            }
        },
        components: {
            alert: Alert,
        },
        methods: {
            getUser() {
                const path = 'http://localhost:8081/api/users/' + this.userCurrent.username;

                axios.get(path)
                .then((result) => {
                    this.user = result.data;
                })
                .catch((error) => {
                    this.message = 'not result';
                    this.showMessage = true,
                    this.status = 'error',
                    console.error(error);

                });
            },
            removeBook(bookID) {
                const path = `http://localhost:8081/api/users/` + this.userCurrent.username + `user/books/${bookID}`;

                axios.delete(path)
                .then(() => {
                    this.getUser();
                    this.message = 'Книга возвращена пользователем';
                    this.status = 'success';
                    this.showMessage = true;
                })
                .catch((error) => {
                    this.message = 'Не удалось вернуть книгу';
                    this.status = 'error';
                    this.showMessage = true;
                    console.error(error);
                    this.getUser();
                });
            },
            onDeleteBookFromUser(book) {
                this.removeBook(book.id);
            },
        },
        created () {
            this.getUser();
        }
    }
</script>