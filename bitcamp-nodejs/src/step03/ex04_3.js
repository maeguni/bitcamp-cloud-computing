//주제: SQL 요청 처리하기 - 회원 등록하기
//[실행URL]
// => http://localhost:8000/member/add?id=user100&email=user100@test.com$
//[출력 결과]
// 등록성공입니다.
const http = require('http')
const url =require('url')
const mysql =require('mysql');

var pool = mysql.createPool({
    connectionLimit : 10,
    host:'13.209.64.30',
    //port:'3306'
    database:'studydb',
    user : 'study',
    password :'1111'    
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
    
    if (urlInfo.pathname !== '/member/update') {
        res.end('해당 URL을 지원하지 않습니다!');
        return;
    }

    var id = urlInfo.query.id
    var email = urlInfo.query.email
    var password = urlInfo.query.password
    
    pool.query(`update pms2_member set email = ?, pwd=?
            where mid =?`,
            [email,
            password,
            id],
        function(err, results) {
            if (err) {
                res.end('DB 조회 중 예외 발생!')
                return;
            }
           
            res.write('변경성공');
            res.end();
    });
});

server.listen(8000, () => {
    console.log('서버가 시작됨!')
})









