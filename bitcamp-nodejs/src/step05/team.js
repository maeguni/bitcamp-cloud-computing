//주제:/team/* 요청을 처리할 라우터 만들기

const mysql = require('mysql')
const express = require('express')
const router = express.Router();
const teamdao = require('./teamdao')

router.use((req,res,next) => {
    console.log('team.js 실행!')
    next();    
})

var pool = mysql.createPool({
    connectionLimit: 10,
    host:'13.209.64.30',
    // port: '3306',
    database: 'studydb',
    user: 'study',
    password: '1111'
});

teamdao.setConnectionPool(pool);


// '/team/list' 요청이 들어왔을 때 오출될 메서드 등록
router.get('/list',(req, res)=> {
    res.writeHead(200,{'content-Type' : 'text/plain;charset=UTF-8'});
    var pageNo = 1;
    var pageSize = 3;
    
    if(req.query.pageNo){
        pageNo = parseInt(req.query.pageNo)             
    }
    if(req.query.pageSize){
        pageSize = parseInt(req.query.pageSize)         
    }
    teamdao.list(pageNo,pageSize,(err,results) => {
        if(err){
            res.end('DB 조회 중 예외 발생!')
           return;
        }   
        for(var row of results){
            res.write(`${row.name},${row.sdt},${row.edt},${row.max_qty}\n`);   
        }    
        res.end();    
    });
});

// '/team/view' 요청이 들어왔을 때 호출될 메서드 등록
router.get('/add',(req, res)=> {
    res.writeHead(200, {'Content-Type': 'text/plain;charset=UTF-8'});
    teamdao.add(req.query ,(err,result)=>{
         if(err){
             res.end('데이터 처리 중 예외 발생!')
             return;                 
         }
        res.write('등록성공!\n')
        res.end();    
        
    });
});

/*router.get('/',(req, res)=> {
    res.writeHead(200, {'Content-Type': 'text/plain;charset=UTF-8'});
    res.write('팀 상세 정보입니다.');
    res.end();    
});

router.get('/view',(req, res)=> {
    res.writeHead(200, {'Content-Type': 'text/plain;charset=UTF-8'});
    res.write('팀 상세 정보입니다.');
    res.end();    
});
*/
module.exports = router;


