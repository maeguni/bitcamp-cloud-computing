//모듈 정의 V
// - 응용: private 변수를 갖는 객체만들기
//
module.exports = function(){
    var result = 0;
    
    return {
        // {}에서 함수를 정의하는 방법 1
        plus (value) {result += value},
        minus(value) {result -= value},        
        multiple(value) {result *= value},
        divide(value) {result /= value},
        getResult(){return result}
        
    };
};