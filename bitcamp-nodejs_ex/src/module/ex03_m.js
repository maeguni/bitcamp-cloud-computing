function plus(a,b){return a + b}
function minus(a,b){return a - b}
function multiple(a,b){return a * b}
function divide(a,b){return a / b}

// module안에 정의 되어있는 exports 안에  함수를 담는다.

module.exports.plus = plus;
module.exports.minus = minus;

exports.multiple = multiple;
exports.divide = divide;


