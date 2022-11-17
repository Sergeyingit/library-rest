<template>
    <div class="container">
        <div class="row flex-column">
            <div>
                <h1>Книги в библиотеке</h1>
                <br>
                <alert :message="message" :status="status" v-if="showMessage"></alert>
                <br>
                <br>
                <table class="table table-hover" v-if="books.length > 0">
                    <thead>
                        <tr>
                            <th>
                                id
                            </th>
                            <th>
                                Название
                            </th>
                            <th>
                                Автор
                            </th>
                            <th>
                                Количество
                            </th>
                            <th>
                                Текущее количество
                            </th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(book, index) in books" :key="index">
                            <td>
                                {{ book.id }}
                            </td>
                            <td>
                                {{ book.name }}
                            </td>
                            <td>
                                {{ book.author }}
                            </td>
                            <td>
                                {{ book.quantity }}
                            </td>
                            <td>
                                {{ book.quantityCount }}
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary btn-sm"
                                    v-if="!userBooks.includes(book.id)"
                                    @click="addToUser(book)">Взять почитать</button>
                                <button type="button" class="btn btn-danger btn-sm"
                                    v-if="userBooks.includes(book.id)"
                                    @click="onDeleteBookFromUser(book)">Вернуть книгу</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p v-else>В библиотеке нет книг</p>
            </div>
        </div>
       
    </div>
</template>

<script>
import axios from 'axios';
import Alert from './Alert.vue';

export default {
    name: 'Books',
    data() {
        return {
            books: [],
            message: '',
            showMessage: false,
            status: '',
            userCurrent: JSON.parse(localStorage.getItem('userCurrent')),
            userBooks: []
        };
    },
    components: {
        alert: Alert,
    },
    methods: {
        // checkUserBooks(books) {
            
            
        //     let bookDtoList = [];

        //     for(let i = 0; books.length > 0; i++) {
        //         let bookDto = {
        //             id: books[i].id,
        //             name: books[i].name,
        //             author: books[i].author,
        //             quantityCount: books[i].quantityCount,
        //             isUserHas: books[i].users.find(user => user.username === this.userCurrent.username) ? true : false
        //         }
                
        //         bookDtoList[i] = bookDto;
                
        //     }
        //     this.books = bookDtoList;
            
        // },
        getBooks() {
            const path = 'http://localhost:8081/api/books';
            axios.get(path)
            .then((result) => {
               
                this.books = result.data;
                // this.checkUserBooks(result.data);
                // console.log(this.books);
            })
            .catch((error) => {
                this.message = 'not result';
                

            })
        
        },
        getUserBooks() {
            const path = 'http://localhost:8081/api/users/' + this.userCurrent.username + '/books';

            axios.get(path)
            .then((result) => {
                this.userBooks = result.data.map(el => (el.id));
            })
            .catch((error) => {
                this.message = 'not result';
                this.showMessage = true,
                this.status = 'error',
                console.error(error);

            });
        },
        addToUser(book) {
            const path = 'http://localhost:8081/api/users/' + this.userCurrent.username + '/books/';

            const payload = {
                id: book.id,
                name: book.name,
                author: book.author,
                quantity: book.quantity,

            };

            axios.post(path, payload)
            .then(() => {
                this.getBooks();
                this.getUserBooks();
                this.message = 'Книга взята читателем ' + this.userCurrent.username;
                this.status = 'success';
                this.showMessage = true;
            })
            .catch((error) => {
                this.message = 'Не удалось взять книгу';
                this.status = 'error';
                this.showMessage = true;
                console.log(error);
                this.getBooks();
                this.getUserBooks();
            });
        },
        onDeleteBookFromUser(book) {
            const path = 'http://localhost:8081/api/users/' + this.userCurrent.username + '/books/' + book.id;

            axios.delete(path)
            .then(() => {
                this.getBooks();
                this.getUserBooks();
                this.message = 'Книга возвращена читателем ' + this.userCurrent.username;
                this.status = 'success';
                this.showMessage = true;
            })
            .catch((error) => {
                this.message = 'Не удалось вернуть книгу';
                this.status = 'error';
                this.showMessage = true;
                console.error(error);
                this.getBooks();
                this.getUserBooks();
            });
        },
    },
    created() {
        this.getBooks();
        this.getUserBooks();
    },
};
</script>