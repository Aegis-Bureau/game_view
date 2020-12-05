//引入express框架
const express = require('express');
//引入body-parser中间件
const bodyParser = require('body-parser');
//导入pro接口模块
const proRouter = require('./router/pro.js'); 

//创建服务器
const app = express();

//监听9090端口
app.listen(9090);
//配置body-parser中间件
app.use( bodyParser.urlencoded({
  extended : false
}) );

//使用pro接口模块，并添加前缀
app.use('/pro',proRouter);