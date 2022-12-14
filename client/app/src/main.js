// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import 'bootstrap/dist/css/bootstrap.css';
import BootstrapVue from 'bootstrap-vue';
import Vue from 'vue';
import App from './App';
import router from './router';
import Keycloak from 'keycloak-js';
import axios from 'axios';


Vue.config.productionTip = false;

Vue.use(BootstrapVue);
// Vue.use(KeycloakPlugin);

function setCurrentUserToLocalStorage(keycloak) {
  let isAdmin = false;
  let isUser = false;
  let roles = keycloak.tokenParsed.realm_access.roles;
  for(let i = 0; roles.length > i; i++) {
    if(roles[i] === 'ADMIN') {
      isAdmin = true;
    } else if (roles[i] === 'USER') {
      isUser = true;
    }
  }

  let userCurrent = {
      'username': keycloak.tokenParsed.preferred_username,
      'isAdmin': isAdmin,
      'isUser': isUser,
  }
  localStorage.setItem('userCurrent', JSON.stringify(userCurrent));
};

function removeCurrentUserFromLocalStorage() {
  localStorage.removeItem('userCurrent');
};

function checkIsNewUserAndPost(username) {
  const path = process.env.SERVER_RESOURCE + '/api/users/' + username;
  
  axios.get(path)
  .then(() => {
    console.log("reg");
  })
  .catch((error) => {
    if (error.response.status === 404) {
      const path = process.env.SERVER_RESOURCE + '/api/users'
      const payload = {
        "username": username,
      }
      axios.post(path, payload)
      .then(() => {
        console.log("success");
      })
      .catch((error) => {
          
          console.log(error.response);
        
      });
    }
    console.log(error.response);
  });
};

function setTokenToHeader(token) {
  axios.defaults.headers.common['Authorization'] = 'Bearer ' + token;

}
const initOptions = {
  url: process.env.SERVER_AUTH + '/auth', realm: 'my_realm', clientId: 'my_client', onLoad: 'login-required'
}
console.log("process.env.SERVER_AUTH");
console.log(process.env.SERVER_AUTH);
const keycloak = Keycloak(initOptions);
// let token;
keycloak.init({ onLoad: initOptions.onLoad }).then((auth) => {
  if (!auth) {
      console.log("no auth");
      window.location.reload();
  } else {
      console.log("auth");
      setCurrentUserToLocalStorage(keycloak);

      setTokenToHeader(keycloak.token);
      checkIsNewUserAndPost(keycloak.tokenParsed.preferred_username);

      new Vue({
        el: '#app',
        router,
        components: { App },
        template: '<App/>',
      });
      
  }

  //Token Refresh
  setInterval(() => {
      keycloak.updateToken(70).then((refreshed) => {
      if (refreshed) {
          console.log('Token refreshed');
          setCurrentUserToLocalStorage(keycloak);
          setTokenToHeader(keycloak.token);
      } else {
          console.log('Token not refreshed, valid for '
          + Math.round(keycloak.tokenParsed.exp + keycloak.timeSkew - new Date().getTime() / 1000) + ' seconds');
      }
      }).catch(() => {
          console.log('Failed to refresh token');
          removeCurrentUserFromLocalStorage();
      });
  }, 60000)

}).catch(() => {
  console.log("Authenticated Failed");
  removeCurrentUserFromLocalStorage();

});

