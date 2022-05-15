## 前后端交互项目

配套视频学习地址：[传送门](https://www.bilibili.com/video/BV137411B7vB?p=5&share_source=copy_web)

## 前后端分离

前端代码和后端代码分开写

**不使用**：传统的java Web开发中，前端用JSP开发，JSP是由后端开发者来独立完成的。代码复杂，影响开发效率，耦合高。

**使用**：前端独立编写客户端代码，后端也只需要独立编写服务端代码提供数据接口就可以。前端通过Ajax请求来访问后端的数据接口，将Model展示到View中

**前提**：前后端开发者需要提前约定好接口文档（URL ,参数，数据接口），然后分别独立开发即可，前端可以造假数据进行测试，完全不需要依赖于后端，最后完成前后端集成就可以。真正实现了前后端应用的解耦合，极大的提高了开发效率。

> 前端应用：负责数据展示和用户交互
> 后端应用：负责提供数据处理接口

前后端分离就是将一个单体应用拆分成两个独立的应用，前端应用和后端应用可以使用JSON格式进行数据交互。

**传统的单体应用**

![Snipaste_2022-05-11_10-01-33](https://user-images.githubusercontent.com/72584937/168466811-8015b49d-7c35-4767-b562-61437e976942.png)

**前后端分离的结构**


![Snipaste_2022-05-11_10-03-43](https://user-images.githubusercontent.com/72584937/168466817-a4800b19-0361-44c1-b4c1-1b2fac8f20e9.png)

## 实现技术
Spring Boot+Vue
使用Spring进行后端开发 ，使用 Vue进行前端应用开发
后端使用springboot Jpa对数据库进行操控
![Snipaste_2022-05-12_09-07-39](https://user-images.githubusercontent.com/72584937/168466832-52e702fe-2374-4f2f-a895-051286527acd.png)


## 搭建步骤
### 新建Vue项目
在程序终端中输入下面代码，来使用vue自带的图形化界面创建器，要比终端创建更方便一些。
```cmd
vue ui
```

![Snipaste_2022-05-12_09-10-12](https://user-images.githubusercontent.com/72584937/168466909-0ddce5b3-3290-4e7b-bf73-4cc178a84174.png)


在界面中选择自己需要安装的组件，比如（Router,Vuex等）。等待项目搭建完成。
在项目根目录中，输入下面代码来安装axios
```cmd
vue add axios
```

然后在vue项目的View文件夹里，新建组件BookInfo，用来展示图书信息

- BookInfo.vue
```
<template>
  <div>
    <table>
      <tr>
        <td>图书编号</td>
        <td>图书名称</td>
        <td>作者</td>
      </tr>
      <tr v-for="item in books">
        <td>{{item.id}}</td>
        <td>{{item.name}}</td>
        <td>{{item.author}}</td>
      </tr>
    </table>
    {{msg}}
  </div>
</template>

<script>

export default {
  name: "BookInfo",
  data(){
    return {
      msg:'hello vue',
      books:[{
        id:1,
        name:'解忧杂货店',
        author:'东野圭吾'
      },
      {
        id:2,
        name:'解忧杂货店',
        author:'东野圭吾'
      },{
        id:3,
        name:'解忧杂货店',
        author:'东野圭吾'
      },
      ]
    }
  },
  

}
</script>

<style>

</style>
```
### 页面之间的映射以及跳转
在router文件夹里，有路由配置文件index.js

- 先引入组件
```
import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import BookInfo from "@/views/BookInfo";
import book from "@/views/Book";

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
    component: ()=> import('../views/Book')
  }


]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

```

- 在router里进行配置，将组件和path对应起来
- 接下来到App.vue也就是程序首页面进行修改，使用router-link标签里的to属性对组件进行关联

```
<template>
  <div id="app">
    <nav>
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link> |
      <router-link to="/book">图书列表</router-link> |
      <router-link to="/bookInfo">图书管理</router-link>

    </nav>
    <router-view/>
  </div>
</template>
```

- 页面效果

![Snipaste_2022-05-12_09-34-34](https://user-images.githubusercontent.com/72584937/168466903-120b966d-d022-462f-bb1c-12181e56b88a.png)


### 新建springboot项目
在搭建项目时选择如下依赖，这里使用splringboot Jpa搭建
![Snipaste_2022-05-12_09-16-32](https://user-images.githubusercontent.com/72584937/168466890-62b2ddda-3701-4974-af00-a926003bb8c8.png)



之后对项目进行配置，将application.yml格式文件换成application.yml格式文件，来对数据库进行配置

- application.yml
```yml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/my_db_01?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai
    username: root
    password: root
    driver-class-name: com.mysql.cj.jdbc.Driver
  jpa:
    show-sql: true
    properties:
      hibernate:
        format_sql: true
server:
  port: 8181
```

- pom.xml 热部署
在依赖中引入即可
```
		<dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <optional>true</optional>
            <scope>true</scope>
        </dependency>
```
搭建完成后，先创建实体类，实体类就对应相应的表名。
### 创建Book实体
```
import javax.persistence.Id;
import lombok.Data;

import javax.persistence.Entity;

@Entity
@Data
public class Book {
    @Id
    private Integer id;
    private String name;
    private String author;
}

```

>@Entity用来标注此类是实体类
>@Data是lombok依赖引入，可以简化开发

[lombok介绍](http://t.csdn.cn/1kyc1)

### 创建Dao层
不懂的同学可以看这篇文章

[最详细的Spring-data-jpa入门](http://t.csdn.cn/JKNmi)
创建BookRepositiory类来进行数据库的交互

- BookRepositiory
```
import com.example.myshop_2_1323ly.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book,Integer> {
}

```

### 创建controller
创建BookHandler来进行交互

- BookHandler
```
import com.example.myshop_2_1323ly.entity.Book;
import com.example.myshop_2_1323ly.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/book")
public class BookHandler{
    @Autowired
    private BookRepository bookRepository;

    @GetMapping("/findAll")
    public List<Book> findAll(){

        List<Book> all = bookRepository.findAll();
        System.out.println(all);
        return all;

    }
}

```

创建到这里，你的后端应该是可以访问到数据库的。


![Snipaste_2022-05-12_09-52-57](https://user-images.githubusercontent.com/72584937/168466876-f9782556-d5cc-46e5-a51e-e868607e0bf1.png)


### 前后端数据交互
前端使用axios
在 BookInfo中加入下面代码
```
export default {
  name: "BookInfo",
  data(){
    return {
      msg:'hello vue',
      books:[{
        id:1,
        name:'解忧杂货店',
        author:'东野圭吾'
      },
      {
        id:2,
        name:'解忧杂货店',
        author:'东野圭吾'
      },{
        id:3,
        name:'解忧杂货店',
        author:'东野圭吾'
      },
      ]
    }
  },
  created() {
    const _this=this
    axios.get('http://localhost:8181/book/findAll').then(function (resp){
      _this.books = resp.data
    })
  }

}
```
这时前端是肯定拿不到数据，这考虑到跨域的问题

### 后端解决跨域
在CrosConfig文件中，新建CrosConfig类

- CrosConfig
```
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@CrossOrigin
public class CrosConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedMethods("GET", "HEAD", "POST", "PUT", "DELETE", "OPTIONS")
                .allowCredentials(true)
                .maxAge(3600)
                .allowedOriginPatterns("*")
                .allowedHeaders("*");
    }
}
```

做到这里，如果前面没问题的化，是可以实现前后端分离的

![Snipaste_2022-05-12_10-06-07](https://user-images.githubusercontent.com/72584937/168466868-eaa72f36-c1ec-4d82-9426-83f946e5b6c8.png)

### 在vue里引入element-ui
1. 在项目根目录执行命令：npm i element-ui -S进行安装

```
npm i element-ui -S
```
2. 在main.js中引入element

```
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/zh-CN'
Vue.use(ElementUI,{size:'mdeium',locale})

```
3. 在组件中直接使用

###  Element UI
[Element UI官网](https://element.eleme.cn/#/zh-CN/component/installation)

Vue 集成 Element UI
Element UI 后台管理系统主要的标签：

- el-container：构建整个⻚⾯框架。
- el-aside：构建左侧菜单。
- el-menu：左侧菜单内容，常⽤属性：

|       属性       |                    作用                     |
| :--------------: | :-----------------------------------------: |
| :default-openeds | 默认展开的菜单，通过菜单的 index 值来关联。 |
| :default-active | 默认选中的菜单，通过菜单的 index 值来关联。 |

- el-submenu：可展开的菜单，常⽤属性：

|       属性       |                    作用                     |
| :--------------: | :--------------------------------------: |
|index | 菜单的下标，⽂本类型，不能是数值类型 |

- template：对应 el-submenu 的菜单名。
- i：设置菜单图标，通过 class 属性实则
	- el-icon-messae
	- el-icon-menu
	- el-icon-setting
- el-menu-item：菜单的⼦节点，不可再展开，常⽤属性：

|       属性       |                    作用                     |
| :--------------: | :--------------------------------------: |
|index | 菜单的下标，⽂本类型，不能是数值类型 |

## 分页思路
这里仍然使用前面的代码，继续添加功能。
从element-ui这里找到自己喜欢的表格格式
```
<template>
  <el-table
    :data="tableData"
    height="250"
    border
    style="width: 100%">
    <el-table-column
      prop="date"
      label="日期"
      width="180">
    </el-table-column>
    <el-table-column
      prop="name"
      label="姓名"
      width="180">
    </el-table-column>
    <el-table-column
      prop="address"
      label="地址">
    </el-table-column>
  </el-table>
</template>

<script>
  export default {
    data() {
      return {
        tableData: [{
          date: '2016-05-03',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-04',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, 
        ]
      }
    }
  }
</script>
```
将上面代码添加到vue模板中，选择自己喜欢的分页，再复制的vue模板中
> 注意：模板只能有一个根标签


```
<el-pagination
  background
  layout="prev, pager, next"
  :total="1000">
</el-pagination>
```
>注意：
>1. 模板默认每页100条数据
>2. ：tatal是数据总数，每页10个数据，一共100页
>3. 添加 page-size="6"  设置每页6条数据

- 模板页面

```
<template>
  <div>
    <el-table
        :data="tableData"
        border
        style="width: 100%">
      <el-table-column
          prop="id"
          label="图书编号"
          width="180">
      </el-table-column>
      <el-table-column
          prop="name"
          label="图书名称"
          width="180">
      </el-table-column>
      <el-table-column
          prop="author"
          label="图书作者">
      </el-table-column>
      <el-table-column
          fixed="right"
          label="操作"
          width="100">
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.row)" type="text"   size="small">查看</el-button>
          <el-button type="text" size="small">编辑</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
        background
        layout="prev, pager, next"
        page-size="6"
        :total="total"
        @current-change="page">
    </el-pagination>

  </div>
</template>
```
### 给页码绑定点击事件
在页面里添加
```html
<el-pagination
        background
        layout="prev, pager, next"
        page-size="6"
        :total="total"
        @current-change="page">  //添加这个
    </el-pagination>
```
在methods里添加方法：
```js
methods:{
    handleClick(row){
      console.log(row)
    },
    page(currentPage){
      const _this=this
      axios.get('http://localhost:8181/book/findAll/'+currentPage+'/6').then(function (resp){
        _this.tableData = resp.data.content
        _this.total = resp.data.totalElements
      })
    }
  },
```
> 注意：
> 在回调函数里，this指的是回调函数，而不是全局对象，所以需要在外部定义一个_this

- 该组件下的JS代码
```js
<script>
export default {

  methods:{
    handleClick(row){
      console.log(row)
    },
    page(currentPage){
      const _this=this
      axios.get('http://localhost:8181/book/findAll/'+currentPage+'/6').then(function (resp){
        _this.tableData = resp.data.content
        _this.total = resp.data.totalElements
      })
    }
  },
  data(){
    return {
      total:null,
      tableData:null
    }
  },
  created() {
    const _this=this
    axios.get('http://localhost:8181/book/findAll/1/6').then(function (resp){
      _this.tableData = resp.data.content
      _this.total = resp.data.totalElements
    })
  }

}
</script>
```

### 后端
使用spring boot JPA内置的分页API
```java
@CrossOrigin
@RestController
@RequestMapping("/book")
public class BookHandler{
    @Autowired
    private BookRepository bookRepository;

    @GetMapping("/findAll/{page}/{size}")
    public Page<Book> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        Pageable pageable = PageRequest.of(page-1,size);  
        Page<Book> all = bookRepository.findAll(pageable);
        return all;
    }
}
```
> 注意：
> of方法把你需要查询的数据传过来，这里的页面是从0开始的（比如要第一页的6条信息，那就是（0，6））
