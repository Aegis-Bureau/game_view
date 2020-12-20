const express = require("express");
// 引入数据库
const pool = require("../pool.js");

// 创建路由器对象
const ly = express.Router();

ly.get('/game', (req, res) => {
  let sql = 'select label,img from game_game';
  pool.query(sql, (err, result) => {
    if (err) throw err;
    let items = result;
    let sql = 'select title,img,begin from game_live'
    pool.query(sql, (err, result) => {
      if (err) throw err;
      res.send({ code: 200, message: '查询成功！', items, result });
    })
  })
});

ly.get('/report', (req, res) => {
  let id = req.query.id == 0 ? 7 : req.query.id;
  let sql = req.query.id == 0 ?
    `select label,created_times,created_time,title,name_1,img_1,name_2,img_2,result from game_details inner join game_game on game_id=gid where did<=? order by created_times` :
    `select label,created_times,created_time,title,name_1,img_1,name_2,img_2,result from game_details inner join game_game on game_id=gid where game_id=? order by created_times`;

  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    let sss = [];
    result.forEach((a) => {
      sss.push({
        times: a.created_times,
        games: [{
          sort: a.label,
          time: a.created_time,
          title: a.title,
          name_1: a.name_1,
          img_1: a.img_1,
          name_2: a.name_2,
          img_2: a.img_2,
          result: a.result,
        }]
      });
      for (let i = 0; i < sss.length; i++) {
        for (let j = i + 1; j < sss.length; j++) {
          if (String(sss[i].times).substr(0, 5) == String(sss[j].times).substr(0, 5)) {
            sss[i].games.push(sss[j].games[0]);
            sss.splice(j, 1);
            j--;
          }
        }
      }
    });
    res.send({ code: 200, message: '查询成功！', sss });
  });
});

// 注册登录
ly.post('/login',(req,res)=>{
  let name = req.body.name;
  let sql = 'select nickname,avatar from game_users where phone=?';
  pool.query(sql,[name],(err,result)=>{
    if(err) throw err;
    if(result.length!=0){
      res.send({code:200,message:'登录成功',info:result[0]});
    }else{
      let sql = 'insert into game_users(username,password,phone) values(?,md5(12345678),?)';
      pool.query(sql,[name,name],(err,result)=>{
        if(err) throw err;
        res.send({code:200,message:'注册成功',info:{ nickname:`${name}`, avatar: 'unnamed.jpg',password:'123456' }});
      });
    }
  })
});



// 导出路由器对象
module.exports = ly;