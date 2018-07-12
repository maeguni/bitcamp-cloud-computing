/*
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;

public class Test {

    public static void main(String[] args) throws URISyntaxException {
      ClassLoader defaultClassLoder =ClassLoader.getSystemClassLoader();
      
      URL url = ClassLoader.getSystemResource("bitcamp/pms");   
      System.out.println(url.toString());

       File file = new File(url.toURI());
       
       findClass(file, "bitcamp.pms");
       }

    static void findClass(File path) {                
            
       
        
          File[] subFiles =  path.listFiles((File pathname)->{;
                     if(pathname.isDirectory())
                  return true;
              if(pathname.isFile()&&
                      pathname.getName().endsWith(".class"))
                  return true;
              return false;
      
          
          });

              
          for(File subFile : subFiles) {
              if(subFile.isFile()) {
                 Strimng SysubFile.packageName +"."+subFile.getName());
                 
              }else{
                  findClass(subFile, packageName +"."+subFile.getName());
                  
              }
          }
    }
   
        

import java.io.File;
import java.lang.reflect.Constructor;
import java.net.URL;

import org.graalvm.compiler.hotspot.nodes.GetObjectAddressNode;

import bitcamp.pms.annotation.Component;
import bitcamp.pms.annotation.Controller;
import bitcamp.pms.annotation.Repository;


public class Test {

    static HashMamp<Object,>  = new hashMap<>();
    

    public static void main(String[] args) throws Exception {
        ClassLoader defaultClassLoader = ClassLoader.getSystemClassLoader();

        URL url = defaultClassLoader.getResource("bitcamp/pms");
        File file = new File(url.toURI());

        findClass(file, "bitcamp.pms");
        
           injectDependency();
    
    }

    private static void injectDependency() {
        // TODO Auto-generated method stub
        
    }

    static void findClass(File path, String packageName) {

        File[] subFiles = path.listFiles((File pathname) -> {
            if (pathname.isDirectory())
                return true;
            if (pathname.isFile() && pathname.getName().endsWith(".class"))
                return true;
            return false;
        });

        for (File subFile : subFiles) {
            if (subFile.isFile()) {
                String className = packageName + "." + subFile.getName().replace(".class", "");
                createObject(className);
            } else {
                findClass(subFile, packageName + "." + subFile.getName());
            }
        }
    }

    private static void createObject(String className) {
        try {
            // 클래스 이름(패키지명 + 클래스명)으로 .class 파일을 찾아 로딩한다.
            Class<?> clazz = Class.forName(className);
           //@Component,@Controller,@Repository  애노테이션이
            //붙은 클래스가 아니라면 객체를 생성하지 않는다
           if( clazz.getAnnotation(Component.class) == null &&
                clazz.getAnnotation(Controller.class) == null &&
                clazz.getAnnotation(Repository.class) == null)
               return;                
         
            
            // 클래스 정보를 보고 기본 생성자를 알아낸다.
            Constructor<?> constructor = clazz.getConstructor();
           
            // 객체를 저장할 떄 사용할 이름을 알아낸다 
               String objname = getobjectname(clazz);
               
                   
           
                    
            // 기본 생성자를 호출하여 객체를 생성한 후 객체 보관소에 저장한다.
            objPool.pput(objName.Constructor());
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    private static String getobjectName(Class<?> clazz)throws Exception{

    String objName = null;
    Component compAnno =            
             clazz.getAnnotation(Component.class);
   if (compAnno != null)
       objName = compAnno.value();
   
   Controller ctrpAnno = clazz.getAnnotation(Controller.class);
  if (compAnno != null)
      objName = compAnno.value();
  Repository repoAnno =               
         clazz.getAnnotation(Repository.class);
 if (compAnno != null)
     objName = compAnno.value();
  if(objName.length()== 0) {
      return clazz.getCanonicalName();
  }else {
      
  }
}
}
*/
import bitcamp.pms.context.ApplicationContext;

public class Test {

    
    
    public static void main(String[] args) throws Exception {
        
        ApplicationContext iocContainer = 
                new ApplicationContext("bitcamp.pms");
        
        Object obj = iocContainer.getBean("/member/ohora");
        System.out.println(obj.getClass().getName());
        
    }
}









