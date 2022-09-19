import Vue from 'vue'
import App from './App.vue'
import VueRouter from "vue-router";
import router from "@/router/router";
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios'
import {displayDataLabelFromValue} from "./utils/base"

Vue.prototype.axios = axios
axios.defaults.baseURL = '/api'
Vue.config.productionTip = false
Vue.prototype.displayDataLabelFromValue = displayDataLabelFromValue

Vue.use(VueRouter)
Vue.use(ElementUI);
new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
