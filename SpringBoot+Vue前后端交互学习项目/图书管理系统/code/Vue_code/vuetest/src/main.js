import Vue from 'vue'
import './plugins/axios'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/zh-CN'

Vue.config.productionTip = false

Vue.use(ElementUI,{size:'mdeium',locale})
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
