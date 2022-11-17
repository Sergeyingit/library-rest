<template>
  
  <div id="app">
    <div class="container">

        <ul class="list-unstyled row justify-content-between">
          <li><a href="/" class="btn btn-info btn-sm">Главная</a></li>
          <li><a href="/profile" class="btn btn-info btn-sm">Личный кабинет</a></li>
          <li><a href="/admin" class="btn btn-info btn-sm" v-if="userCurrent.isAdmin==true">Администрирование</a></li>
          <li><a href="http://localhost:8082/auth/realms/my_realm/protocol/openid-connect/logout?redirect_uri=http%3A%2F%2Flocalhost%3A8080%2F" class="btn btn-danger btn-sm">Выход</a></li>
        </ul>
      <br>
      <br>
      <br>
    </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      userCurrent: JSON.parse(localStorage.getItem('userCurrent')),
    }
  }
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
