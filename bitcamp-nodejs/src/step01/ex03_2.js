//주제: 모듈을 정의하고 사용하기II
//
//
// 리턴값 destructuring
// => 모듈의 경로는 현재 파일의 위치에 상대적이다.
var {plus,minus} = require('./ex03_m.js');

console.log(plus(10,20));
console.log(minus(10,20));
