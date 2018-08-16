package bitcamp.uml.classdiagram.ex3;

// Composition(합성)
// =>한 객체가 다른 객체를 포함하는 관계
// => Container와 Containee가 라이프사이클을 함께한다.
//    즉 Container가 소멸될 때 Containee도 함께 소멸된다.

public class Address {
    String postNo;
    String basicAddr;
    String detailAddr;
    
    
    public Address(String postno, String basicAddr, String detailAddr) {
        // TODO Auto-generated constructor stub
        this.postNo = postno;
        this.basicAddr = basicAddr;
        this.detailAddr = detailAddr;
        
    }
    
    
   
    
    
}
