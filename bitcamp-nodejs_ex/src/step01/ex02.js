

//require를 사용하요 모듈을 가져옴!
const http = require('http');

// 클라이언트에서 요청이 들어왔을떄 호출될 함수를 등록한다.
const server = http.createServer((req, res) => {    
  res.end();  
});

server.listen(8000,()=>{
    console.log("임해군이 만든 웹서버") 
    
});