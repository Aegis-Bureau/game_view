const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const md5 = require('md5');
const ak = require('./routes/ak');
const server = express();
server.use(cors({
  origin: ['http://127.0.0.1:8080', 'http://localhost:8080']
}));

server.use(bodyParser.urlencoded({
  extended:false
}));

server.use("/ak",ak);


// 指定 WEB服务器监听的端口
server.listen(8090);
