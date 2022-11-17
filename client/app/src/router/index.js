import Vue from 'vue';
import Router from 'vue-router';
import Admin from '@/components/Admin';
import StartPage from '@/components/StartPage';
import Profile from '@/components/Profile';
import Books from '@/components/Books';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'StartPage',
      component: StartPage,
    },
    {
      path: '/admin',
      name: 'Admin',
      component: Admin,
    },
    {
      path: '/books',
      name: 'Books',
      component: Books,
    },
    {
      path: '/profile',
      name: 'Profile',
      component: Profile,
    },
  ],
  mode: 'history',
});
