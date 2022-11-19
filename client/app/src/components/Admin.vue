<template>
    <div class="container" v-if="userCurrent.isAdmin==true">
        <div class="row flex-column">
            <div>
                <h1>Книги в библиотеке</h1>
                <br>
                <alert :message="message" :status="status" v-if="showMessage"></alert>
                <button type="button" class="btn btn-success btn-sm" v-b-modal.book-modal>Добавить книгу</button>
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
                            <td v-if="userCurrent.isAdmin==true">
                                <button type="button" class="btn btn-primary btn-sm"
                                    v-b-modal.book-info-modal @click="getReaders(book)">Читатели</button>
                                
                                <button type="button" class="btn btn-warning btn-sm"
                                    v-b-modal.book-update-modal @click="editBook(book)">Редактировать</button>
                                <button type="button" class="btn btn-danger btn-sm" @click="onDeleteBook(book)">Удалить</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p v-else>В библиотеке нет книг</p>
            </div>
        </div>

        <b-modal ref="addBookModal"
         id="book-modal"
         title="Add a new book"
         hide-footer>
            <b-form @submit="onSubmit" @reset="onReset" class="w-100">
                <b-form-group id="form-name-group"
                    label="Name:"
                    label-for="form-name-input">
                    <b-form-input id="form-name-input"
                        type="text"
                        v-model="addBookForm.name"
                        required
                        placeholder="Enter name">
                    </b-form-input>
                </b-form-group>
                <b-form-group id="form-author-group"
                    label="Author:"
                    label-for="form-author-input">
                    <b-form-input id="form-author-input"
                                type="text"
                                v-model="addBookForm.author"
                                required
                                placeholder="Enter author">
                    </b-form-input>
                </b-form-group>
                <b-form-group id="form-quantity-group"
                    label="Quantity:"
                    label-for="form-quantity-input">
                    <b-form-input id="form-quantity-input"
                                type="number"
                                v-model="addBookForm.quantity"
                                required
                                placeholder="Enter quantity">
                    </b-form-input>
                </b-form-group>
                <b-form-group id="form-quantityCount-group"
                    label="QuantityCount:"
                    label-for="form-quantityCount-input">
                    <b-form-input id="form-quantityCount-input"
                                type="number"
                                v-model="addBookForm.quantityCount"
                                required
                                placeholder="Enter quantityCount">
                    </b-form-input>
                </b-form-group>
                <b-button type="submit" variant="primary">Submit</b-button>
                <b-button type="reset" variant="danger">Reset</b-button>
            </b-form>
        </b-modal>

        <b-modal ref="editBookModal"
         id="book-update-modal"
         title="Update"
         hide-footer>
            <b-form @submit="onSubmitUpdate" @reset="onResetUpdate" class="w-100">
                <b-form-group id="form-name-edit-group"
                label="Name:"
                label-for="form-name-edit-input">
                    <b-form-input id="form-name-edit-input"
                        type="text"
                        v-model="editForm.name"
                        required
                        placeholder="Enter name">
                    </b-form-input>
                </b-form-group>
                <b-form-group id="form-author-edit-group"
                    label="Author:"
                    label-for="form-author-edit-input">
                    <b-form-input id="form-author-edit-input"
                                type="text"
                                v-model="editForm.author"
                                required
                                placeholder="Enter author">
                    </b-form-input>
                </b-form-group>
                <b-form-group id="form-quantity-edit-group"
                    label="Quantity:"
                    label-for="form-quantity-edit-input">
                    <b-form-input id="form-quantity-edit-input"
                                type="number"
                                v-model="editForm.quantity"
                                required
                                placeholder="Enter quantity">
                    </b-form-input>
                </b-form-group>
                <b-form-group id="form-quantityCount-edit-group"
                    label="QuantityCount:"
                    label-for="form-quantityCount-edit-input">
                    <b-form-input id="form-quantityCount-edit-input"
                                type="number"
                                v-model="editForm.quantityCount"
                                required
                                placeholder="Enter quantityCount">
                    </b-form-input>
                </b-form-group>
                <b-button type="submit" variant="primary">Update</b-button>
                <b-button type="reset" variant="danger">Cancel</b-button>
            </b-form>
        </b-modal>
        <b-modal ref="infoBookModal"
            id="book-info-modal"
            title="Info"
            ok-only
            :readers="bookReaders">
            <ul class="list-unstyled" v-if="bookReaders.length > 0">
                <li v-for="(reader, index) in bookReaders" :key="index">id: {{reader.id}}; имя: {{reader.username}}</li>
            </ul>
            <p v-else> Книгу пока никто не брал</p>
        </b-modal>

                
    </div>

    <div class="container" v-else>
        <div class="row flex-column">
            <div>
                <p>У вас нет прав для просмотра страницы администратора</p>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import Alert from './Alert.vue';


export default {
    name: 'Admin',
    data() {
        return {
            books: [],
            addBookForm: {
                'name': '',
                'author': '',
                'quantity': '',
                'quantityCount': '',
            },
            editForm: {
                'id': '',
                'name': '',
                'author': '',
                'quantity': '',
                'quantityCount': '',

            },
            message: '',
            showMessage: false,
            status: '',
            bookReaders: [],
            userCurrent: JSON.parse(localStorage.getItem('userCurrent')),
        };
    },
    components: {
        alert: Alert,
    },
    methods: {
        getBooks() {
            const path = process.env.SERVER_RESOURCE + '/api/books';
            axios.get(path)
            .then((result) => {
                this.books = result.data;
            })
            .catch((error) => {
                this.message = 'not result';
                console.error(error);

            })
        
        },
        addBook(payload) {
            const path = process.env.SERVER_RESOURCE + '/api/books';

            axios.post(path, payload)
            .then(() => {
                this.getBooks();
                this.message = 'Книга добавлена';
                this.status = 'success';
                this.showMessage = true;
            })
            .catch((error) => {
                this.message = 'Не удалось добавить книгу';
                this.status = 'error';
                this.showMessage = true;
                console.log(error);
                this.getBooks();
            });
        },
        initForm() {
            this.addBookForm.name = '';
            this.addBookForm.author = '';
            this.addBookForm.quantity = '';
            this.addBookForm.quantityCount = '';
            this.editForm.id = '';
            this.editForm.name = '';
            this.editForm.author = '';
            this.editForm.quantity = '';
            this.editForm.quantityCount = '';
        },
        onSubmit(evt) {
            evt.preventDefault();
            this.$refs.addBookModal.hide();
            
            
            const payload = {
                name: this.addBookForm.name,
                author: this.addBookForm.author,
                quantity: this.addBookForm.quantity,
                quantityCount: this.addBookForm.quantityCount,
            };
            this.addBook(payload);
            this.initForm();
        },
        onReset(evt) {
            evt.preventDefault();
            this.$refs.addBookModal.hide();
            this.initForm();
        },
        editBook(book) {
            this.editForm = book;
        },
        onSubmitUpdate(evt) {
            evt.preventDefault();
            this.$refs.editBookModal.hide();
            
            const payload = {
                id: this.editForm.id,
                name: this.editForm.name,
                author: this.editForm.author,
                quantity: this.editForm.quantity,
                quantityCount: this.editForm.quantityCount,
            };
            this.updateBook(payload);
        },
        updateBook(payload) {
            const path = process.env.SERVER_RESOURCE + '/api/books';

            axios.put(path, payload)
            .then(() => {
                this.getBooks();
                this.message = 'Книга обновлена';
                this.status = 'success';
                this.showMessage = true;
            })
            .catch((error) => {
                this.message = 'Не удалось обновить книгу';
                this.status = 'error';
                this.showMessage = true;
                console.error(error);
                this.getBooks();
            });
        },
        onResetUpdate(evt) {
            evt.preventDefault();
            this.$refs.editBookModal.hide();
            this.initForm();
            this.getBooks();
        },
        removeBook(bookID) {
            const path = process.env.SERVER_RESOURCE + `/api/books/${bookID}`;

            axios.delete(path)
            .then(() => {
                this.getBooks();
                this.message = 'Книга удалена';
                this.status = 'success';
                this.showMessage = true;
            })
            .catch((error) => {
                this.message = 'Не удалось удалить книгу';
                this.status = 'error';
                this.showMessage = true;
                console.error(error);
                this.getBooks();
            });
        },
        onDeleteBook(book) {
            this.removeBook(book.id);
        },
        getReaders(book) {
            this.bookReaders = book.users;
        }
    },
    created() {
        this.getBooks();
    },
};
</script>