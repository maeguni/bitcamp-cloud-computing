//모듈 정의 V
// - 모듈 변수 사용하기
//

 var result = 0;

 module.exports = {
        // {}에서 함수를 정의하는 방법 1
        plus (value) {result += value},
        minus(value) {result -= value},        
        multiple(value) {result *= value},
        divide(value) {result /= value},
        getResult(){return result}
};