<template>
  
  <div id="app">
    <div class="container">

        <ul class="list-unstyled row justify-content-between">
          <li><router-link to="/" class="btn btn-info btn-sm">Главная</router-link></li>
          <li><router-link to="/profile" class="btn btn-info btn-sm">Личный кабинет</router-link></li>
          <li><router-link to="/admin" class="btn btn-info btn-sm" v-if="userCurrent.isAdmin==true">Администрирование</router-link></li>
          <li><a :href="serverAuth + '/auth/realms/my_realm/protocol/openid-connect/logout?redirect_uri=http%3A%2F%2Flocalhost%3A8081%2F'" class="btn btn-danger btn-sm">Выход</a></li>
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
      serverAuth: process.env.SERVER_AUTH
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
