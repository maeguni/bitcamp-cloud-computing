//주제:데이터베이스 프로그래밍-커넥션 풀 사용II

const mysql =require('mysql');

var pool = mysql.createPool({
    connectionLimit : 10,
    host:'13.209.64.30',
    //port:'3306'
    database:'studydb',
    user : 'study',
    password :'1111'    
});

// 커넥션 풀 객체를 이용해 바로 질의를 수행한다.
// =>pool.getConnection() -> con.qurey() -> con.release()의 단축 사용법
pool.query('select * from pms2_member',function(err,results){
    if(err)throw err;
    
    //results 파라미터에 결과가 들어 있다.
    for(var row of results){
        //row 객체에서 값을 꺼낼 때는 SQL에서 지정한 컬럼명 또는 별명을 사용한다.
       console.log(row.email,row.mid,row.pwd) 
    }
    // 이 예제에서는 sql 수행한 후에 프로그램을 종료해야하기때문에 
    // 커넥션 풀을 닫는다.
    pool.end();
  });  
 

console.log('select 실행!');

// ex11.js 와 ex12.js의 비교
//  [ex12.js]
// => ex12.js는 커넥션풀에 대해 바로 query()를 호출할 수 있어
//   코드가 간결해져서 좋다.
// => 하지만 query() 호출할 때마다 새 커넥션을 만들어(꺼내) 사용하기 떄문에
//  한 번에 여러 개의 SQL을 실행할 떄 불리하다.
//  왜 ? 같은 커넥션을 사용하지 않기 떄문이다.
//  =>에)
//  pool.qurey(...); // 커넥션1
//  pool.qurey(...); // 커넥션2

// [11ex.js]
// = >sql을 실행할 때 마다 매번 커넥션을 얻어야 하기 떄문에,
//   ex12.js 보다는 코드가 복잡하다.
// = > 그러나 한 번 커넥션을 얻으면 여러 번  사용할 수 있기 때문에
//     여러개의 sql을 실행할 때 12ex.js 방식 보다는 유리하다.
//  => 예)
//  pool.getConnection(function(err,con){
//  pool.qurey(...); // 커넥션1
//  pool.qurey(...); // 커넥션1
//}
//