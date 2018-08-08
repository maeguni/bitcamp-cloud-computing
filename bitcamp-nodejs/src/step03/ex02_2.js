//주제: 클라이언트에게 출력하기 - 콘텐트 타입 설정하기
const http = require('http')

const server = http.createServer((req,res) => {
    console.log('요청받았음!')        
        // 출력한하는 데이터의 콘텐트 타입을 웹 브라우저에게 알려주지 않았기 떄문에
        // 응답 헤더로 'content-Type'을 지정하라!
    res.writeHead(200,{
       'Content-Type': 'text/plain;charset=UTF-8' 
    });
    
    res.end('안녕');
          
});
server.listen(8000,() => {
    console.log('서버가 시작됨!')
})

