import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import BookInfo from "@/views/BookInfo";
import PageOne from "@/views/AddBook";
import PageTwo from "@/views/BookUpdate";
import PageThree from "@/views/PageThree";
import PageFour from "@/views/PageFour";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path:'/book',
    name:'bookInfo',
    component: () => import('../views/BookInfo')
  },
  {
    path: '/bookInfo',
    name: 'book',
    component: ()=> import('../views/Book'),
    children:[
    ]

  },
  {
    path: '/addBook',
    name: 'addBook',
    component: ()=> import('../views/AddBook')
  },
  {
    path: '/update',
    name: 'BookUpdate',
    component: ()=> import('../views/BookUpdate')
  }


]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
