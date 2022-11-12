<template>
    <div class="container">
        <div class="row">
            <div class="col-sm-10">
                <p>Книги</p>
                <br>
                <alert :message="message" :status="status" v-if="showMessage"></alert>
                <button type="button" class="btn btn-success btn-sm" v-b-modal.book-modal>Добавить книгу</button>
                <br>
                <br>
                <table class="table table-hover">
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
                                <button type="button" class="btn btn-primary btn-sm">Подробнее</button>
                                <button type="button" class="btn btn-warning btn-sm">Редактировать</button>
                                <button type="button" class="btn btn-danger btn-sm">Удалить</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
                                type="text"
                                v-model="addBookForm.quantityCount"
                                required
                                placeholder="Enter quantityCount">
                    </b-form-input>
                </b-form-group>
                <b-button type="submit" variant="primary">Submit</b-button>
                <b-button type="reset" variant="danger">Reset</b-button>
            </b-form>
        </b-modal>
                
    </div>
</template>

<script>
import axios from 'axios';
import Alert from './Alert.vue';
axios.defaults.headers.common['Authorization'] = 'Bearer ' + 'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICItSGotZTE5WXhPcUNocEt5Mng4Q1c2dUJEbHRoME5mc21NZXVwbkV5c2YwIn0.eyJleHAiOjE2NjgyNzg3NTIsImlhdCI6MTY2ODI3ODQ1MiwianRpIjoiZmIxZmQyMjctYjUzYy00NjliLWJhYTAtNWNkNzI3ZTdiZjRkIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4MDgyL2F1dGgvcmVhbG1zL215X3JlYWxtIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImM4Yzg3YjMzLWQ0MGQtNDJlZS1hODM2LTc1ODYyYzNkYWMyMiIsInR5cCI6IkJlYXJlciIsImF6cCI6Im15X2NsaWVudCIsInNlc3Npb25fc3RhdGUiOiI2YWE1OTdmMy1mMThmLTRjNmItYmQ1Yi1jNmRiOWFhNGMwY2EiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC8iXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImRlZmF1bHQtcm9sZXMtbXlfcmVhbG0iLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiQURNSU4iLCJVU0VSIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBlbWFpbCIsInNpZCI6IjZhYTU5N2YzLWYxOGYtNGM2Yi1iZDViLWM2ZGI5YWE0YzBjYSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4ifQ.emZOAOASr7RL2-YXrU-4uFGe8cX_wx2NxSh9tScV0m2Usz_BqPetimJhIX8EW4ZGS5j8psVPWZsa5E3zR93aS309VS0W9mo5JAJ0N1gelEeIxqvlW-4c5P1yVttTsGz8wFIUiaI3tmIXxHyG5UqJChRb8Zqs0NMOG6WfDxID0oQMqQegvYRJ5Jmboufi86KfYEsDBWC04UnyRZEREUb_prOtacqytzKUwV-co49L7OBxKDoavXNADJKO6I3MWm8b7fPClIYPgfdHKrgLoZfVW5JOvZZGgMcVYEITeTF45RHZpWdGEC1f1_tBnw3pgrMOvndf_TgYZuf41ID3wVptww';
export default {
    name: 'Books',
    data() {
        return {
            books: [],
            addBookForm: {
                'name': '',
                'author': '',
                'quantity': '',
                'quantityCount': '',
            },
            message: '',
            showMessage: false,
            status: '',
        };
    },
    components: {
        alert: Alert,
    },
    methods: {
        getBooks() {
            const path = 'http://localhost:8081/api/books';
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
            const path = 'http://localhost:8081/api/books';

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
    },
    created() {
        this.getBooks();
    },
};
</script>
