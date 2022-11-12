import Vue from 'vue';
import Router from 'vue-router';
import Books from '@/components/Books';
import StartPage from '@/components/StartPage';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/books',
      name: 'Books',
      component: Books,
    },
    {
      path: '/',
      name: 'StartPage',
      component: StartPage,
    },
  ],
  mode: 'history',
});
