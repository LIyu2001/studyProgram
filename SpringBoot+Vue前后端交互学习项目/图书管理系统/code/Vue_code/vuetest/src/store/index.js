// 该文件用于创建Vuex中最为核心的store
import Vue from 'vue'
// 引入Vuex
import Vuex from 'vuex'
// 应用Vuex插件
Vue.use(Vuex)

// 准备actions——用于响应组件中的动作
const actions = {
    jia(context,value){
        context.commit('JIA',value)
    },
    jian(context,value){
        context.commit('JIAN',value)
    },
    jiaOdd(context,value){
        if(context.state.sum % 2){
            context.commit('JIA',value)
        }
    },
    jiaWait(context,value){
        setTimeout(() => {
            context.commit('JIA',value)
        }, 3000);
    },

}
// 准备mutataions——用于操作数据（state）
const mutations = {
    JIA(state,value){
        state.sum += value
    },
    JIAN(state,value){
        state.sum -= value
    },
    ADD_PERSON(state,value){
        console.log('ADD_PERSON被调用');
        state.personList.unshift(value)
    }
}
// 准备state——用于存储数据
const state = {
    sum:0, //当前的和
    school:'中北',
    subject:'前端',
    personList:[
        {id:'001',name:'张三'}
    ]
}
// 准备一个getters——用于将state中的数据进行加工
const getters = {
    bigSum(state){
        return state.sum * 10
    }
}

// 创建store
const store = new Vuex.Store({
    actions,
    mutations,
    state,
    getters
})

// 暴露（导出）store
export default store