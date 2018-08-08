//주제 :  여러개의 요청 처리하기 - 각 요청을 함수로 분리하기
//=> 각 요청을 처리하는 코드를 별도의 함수로 분리하면
// 관리하기 편하다.


const http = require('http')
const url = require('url')
const mysql = require('mysql');

var pool = mysql.createPool({
    connectionLimit: 10,
    host:'13.209.64.30',
    //port: '3306',
    database: 'studydb',
    user: 'study',
    password: '1111'
});


const server = http.createServer((req, res) => {
    var urlInfo = url.parse(req.url, true);
    
    if (urlInfo.pathname === '/favicon.ico') {
        res.end();
        return;
    }            
    res.writeHead(200, {
        'Content-Type': 'text/plain;charset=UTF-8'
    });
    
    if (urlInfo.pathname === '/member/list') {  
        list(urlInfo,req,res); 
    
    } else if(urlInfo.pathname === '/member/add') {        
        add(urlInfo,req,res);    
 
    } else if(urlInfo.pathname === '/member/update') {
        update(urlInfo,req,res);   
        
    }else if(urlInfo.pathname === '/member/delete') {
        remove(urlInfo,req,res);    
        
    }else{
    res.end('해당 URL을 지원하지 않습니다!');
    return;}
    });

server.listen(8000, () => {
    console.log('서버가 시작됨!')
})

function list(urlInfo,req,res){
    
    var pageNo = 1;
    var pageSize = 3;
    
    if (urlInfo.query.pageNo) {
        pageNo = parseInt(urlInfo.query.pageNo)
    }
    if (urlInfo.query.pageSize) {
        pageSize = parseInt(urlInfo.query.pageSize)
    }
    
    var startIndex = (pageNo - 1) * pageSize;
    
    pool.query('select mid, email from pms2_member limit ?, ?',
        [startIndex, pageSize],
        function(err, results) {
            if (err) {
                res.end('DB 조회 중 예외 발생!')
                return;
            }
            
            for (var row of results) {
                res.write(`${row.email}, ${row.mid}\n`);
            }
            res.end();
    });

    
    
    
    
}
function add(urlInfo,req,res){
    
    var id = urlInfo.query.id
    var email = urlInfo.query.email
    var password = urlInfo.query.password    
    
    pool.query(`insert into pms2_member(mid,email,pwd) values(?, ?, password(?))`,
        [id, email,password],
        function(err, results) {
            if (err) {
                res.end('DB 등록중 예외 발생!')
                return;
            }            
            res.write('등록성공');
            res.end()            
      });
}
function update(urlInfo,req,res){
    var id = urlInfo.query.id
    var email = urlInfo.query.email

pool.query(`update pms2_member set email = ?
        where mid =?`,
    [email,id],
    function(err, results) {
        if (err) {
            res.end('DB 조회 중 예외 발생!')
            return;
        }       
        res.write('변경완료');
        res.end();
});    
}

function remove(urlInfo,req,res){
var mid = urlInfo.query.id
    
    pool.query(`delete from pms2_member
            where mid=?`, 
        [mid],
        function(err, results) {
            if (err) {
                res.end('DB 조회 중 예외 발생!')
                return;
            }
            
            res.write('삭제되었습니다');
            res.end();
    });
    
}


