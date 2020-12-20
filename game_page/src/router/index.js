import Vue from 'vue'
import VueRouter from 'vue-router'
import wt_index from '../views/wt_index'
import ak_analyze from '../views/ak_analyze'
import ak_game from '../views/ak_game'
import none from '../views/ak_404'
//////////////////////////
import index from '../views/index'
import login from '../views/login'
//////////////////////////
Vue.use(VueRouter)

const routes = [
  {
    path:'/404',
    component:none
  },
  {
    path:'/login',
    component:login
  },
  {
    path:'/me',
    component:index
  },
  {
    path:'/game',
    component:ak_game
  },
  {
    path:'/analyze',
    component:ak_analyze
  },
  {
    path:'/',
    component:wt_index
  }
  // {
  //   path: '/',
  //   name: 'Home',
  //   component: Home
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  routes
})

export default router
