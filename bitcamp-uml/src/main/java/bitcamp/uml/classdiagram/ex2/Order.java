package bitcamp.uml.classdiagram.ex2;

import java.util.List;

// Aggregation(집함)
// => 한 객체가 다른 객체를 포함하는 것을 표현한다.
// => 포함하는 객체를 Container라고 부르고,
//    포함되는 객체를 Containee라 부른다.
// = > Container 와 Containee의 라이프사이클이 다르다.
//    즉 Container(예: order) 객체가 소멸되더라도
//     Containee(예: Custommer,Product)
public class Order {
    
    

    // 포함 관계는  필드로 선언한다.
    Customer customer;
    
    // 여러개를 포함할 경우 배열이나 Collection 객체로 구현한다.
    List<Product>products;
    
    public Order(Customer customer,List<Product>products) {
        this.customer = customer;
        this.products = products;
        
        
    }
   
    
    
    
}
