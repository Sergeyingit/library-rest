<template>
    <div class="container">
        <div class="row flex-column">
          <div>
            <h1>Библиотека</h1>
            <br>
            <router-link to="/profile" class="btn btn-success btn-sm">Личный кабинет</router-link>
            <router-link to="/books" class="btn btn-success btn-sm">Книги</router-link>
          </div>
        </div>
    </div>
</template>
<script>
export default {
  name: 'StartPage',
};
</script>