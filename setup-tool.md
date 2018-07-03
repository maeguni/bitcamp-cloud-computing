# 프로그래밍 준비
## 개발도구 설치
openjdk10.0.1
eclipse photon
visual studio code
git client
scoop (packge manager)
scoop install gradle
scoop install mariadb@10.3.7 삭제
scoop install mysql

##mysql 설정

.....

> mysql -uroot -p
enter password (암호 없기  때문에  그냥 엔터 친다.)

show tables 해서 보고 user에 컬럼 확인
select host, user from user;

root 사용자의  암호 설정
mysql> update user set
authentication_string=password('1111');
muysql > flush privaieges;
msysql >quit

다시 접속 
musql -uroot -p
password :1111

....
애플리케이션에서 DB에 접속할 때 사용할 사용자를 추가 한다
create user 'study'@'localhost' identified by '1111';

stuydy 사용자가 사용할 데이터베이스 생성한다
create database studydb character set utf8 collate utf8_general_ci;

stuydy 데이터베이스의 사용 권한을 studyd에게 부여한다
grant all privileges on studydb.* to 'study'@'localhost';

study 사용자로 접속한다
mysql> quit 또는 exit
>mysql -ustudy -p
enter password :1111
---

study 사용자가 사용항 수 있는 데이터베이스 목록 보기
mysql>usr studydb;

studtdb에 존재하는 테이블 목록 보기
mysql >show tables;

sytudydb에 테이블 생성
=> bitcamp-sql/pms-ddl.sql 실행
mysql>sqL을 복사하여 붗여 넣는다.

'''''

## tomcat 설치
1)톰캣 다운로드
- tomcat.apache.org에서 다운로드

2) 톰캣 설치
- C:


## eclipse 설정

'''
워크스페이스 설정
1)문자집합을 utf-8 로 설정하기
- Preferences/Feneral/Workspace/Text file encoding
- utf-8로 설정한다.

2)에디터 기본 환경 설정
- Preferences/General/Editors/Text Editors
- 탭 크기를 2또는 4로 설정한다
- 탭을 스페이스로 표현한다.
- 한줄 크기는 80자 정도.
- 탭이나 공백에 대한 흐릿하게 표시하기
3)자바 설정
- Preferences/Java/
 - Installed JRE : JDK 위치 지정하기
 - code style/Formatter : 자바 에디터 탭 정보 설정
 - compiler : 기본 컴파일 버전 설정

 4) 웹 환경 설정
 
- Preferences/web/
    -css Filess : 문자 집합 UTF-8로 설정
    -HTML Files : 문자 집합을 UTF-8로 설정
    -JSP FIles : 문자 집합을 UTF-8로 설정

5) WAS 서버 환경 설정
-Preferences/SErvers/
 -Runtime Environments : 톰캣 서버 위치 설정

6) 애플리케이션을 배포하고 테스트할 톰캣 실행 환경 설정
- 

'''



## 웹 프로젝트 폴더 준비
''''

예제 프로젝트 복사 
-java106-java-project 를 
bitcamp-cloud-computing 폴더로 복사한다.

''''
