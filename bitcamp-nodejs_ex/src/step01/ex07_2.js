
var cale = require('./ex07_m')

var obj1 = cale();
var obj2 = cale();



obj1.plus(200);
obj1.minus(100);

obj2.plus(300);
obj2.divide(100);

console.log(obj1.getResult());
console.log(obj2.getResult());