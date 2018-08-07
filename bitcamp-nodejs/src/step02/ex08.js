//주제:데이터베이스 프로그래밍-serlect 실행

const mysql =require('mysql');

var con = mysql.createConnection({
    
    host:'13.209.64.30',
    //port:'3306'
    database:'studydb',
    user : 'study',
    password :'1111'    
});

con.connect(function(err){
    if (err) throw err;     
    
    console.log('연결 성공입니다!');
});

var mid='user03';

con.query(
        `update pms2_member set email = 'user002@test.comxxxxhhhhhh'
         where mid = '${mid}'`,                     
        function(err,results){
    if(err)throw err;
    

     console.log("변경성공!"); 
    
});

con.end(function(err){
    if(err) throw err; 
    console.log('연결을 끊었습니다.')
});
console.log('select 실행!');