import VueRouter from "vue-router"
import Index from "@/components/Index"
import Login from "@/components/Login"
export default new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/',
            component: Index
        },
        {
            path: '/login',
            component: Login
        },
        {
            path: '/system',
            component: {render: (e) => e("router-view")},
            children: [
                {
                    path: 'user',
                    name: 'user',
                    component: () => import('@/components/user/User')
                },
                {
                    path: 'menu',
                    name: 'meun',
                    component: () => import('@/components/menu/Menu')
                },
                {
                    path: 'process',
                    component: () => import('@/components/process/Process')
                },
                {
                    path: 'template',
                    component: () => import('@/components/template/Main')
                }
            ]
        }
    ]
})
