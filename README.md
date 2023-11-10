### 🌼 AGU
### 쇼핑몰 웹사이트 프로젝트

그동안 배운것들을 활용하여 간단한 쇼핑몰을 구현하였다.
<br>프론트 부분은 부트스트랩을 사용했다.(약간 수정)
<br>[참고 사이트](https://startbootstrap.com/template/shop-homepage) 

![첫화면](https://github.com/HbMagpie/AGU/assets/118106602/becd01f5-913c-4221-a839-c57df84043f1)

- CRUD기능을 동작하여 DB설계를 하였다
---

### 🛠 기술 스택
![Badge](https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white) ![Badge](https://img.shields.io/badge/Spring-6DB33F?style=flat&logo=Spring&logoColor=white) ![Badge](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MariaDB&logoColor=white)
![Badge](https://img.shields.io/badge/Bootstrap-563D7C?style=flat&logo=Bootstrap&logoColor=white) ![Badge](https://img.shields.io/badge/HTML-E34F26?style=flat&logo=HTML5&logoColor=white) ![Badge](https://img.shields.io/badge/CSS-1572B6?style=flat&logo=CSS3&logoColor=white) ![Badge](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white) ![Badge](https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white)

### 👥 참여 팀원
| 팀원 이름 | 담당 기능 |
| --- | --- |
| 박한나 | 회원가입 & 로그인 & 장바구니 & 게시판 Reply & 주문 & 결제|
| 한 빛 | 상품 & 검색 & CRUD 게시판 & 관리자 |
 
### 📝 프로젝트 설명
 <br/>
 
* MVC 아키텍처 활용:
  * Model, View, Controller (MVC) 아키텍처를 활용하여 프로젝트를 구성했습니다.<br/>
     이를 통해 코드를 모듈화하고 각 부분이 독립적으로 작동할 수 있도록 설계했습니다.

* Controller 클래스:
  * 사용자 요청을 처리하고 적절한 서비스 메소드를 호출하는 컨트롤러 클래스를 구현했습니다.<br/>
    사용자와의 상호작용을 담당하며, 각 기능에 따라 메소드를 나누어 구현했습니다.

* Service 인터페이스 및 구현체:
  * 비즈니스 로직을 처리하는 Service 인터페이스와 그 구현체를 따로 분리하여 작성했고,<br/>
   이를 통해 서비스 레이어에서 비즈니스 로직을 독립적으로 관리하고 테스트할 수 있게 했습니다.

* Mapper 인터페이스 및 XML 파일:
  * MyBatis를 사용하여 데이터베이스와의 상호작용을 담당하는 Mapper 인터페이스와 그에 대응하는 XML 파일을 작성했습니다. <br/> SQL 쿼리와 자바 코드의 분리를 통해 유지보수성을 높였습니다.

* DTO (Data Transfer Object):
  * 데이터 전송을 위한 객체인 DTO를 사용하여 데이터의 구조를 정의하고,<br/> 이를 통해 각 계층 간에 데이터를 주고받았습니다.

* RESTful한 URL 구조:
  * URL을 RESTful한 구조로 설계했습니다.<br/>각 리소스에 대한 요청이 명확하게 드러나도록 URL을 일관되게 정의했습니다.

* 타일즈를 활용한 뷰 페이지:
  * 타일즈를 사용하여 레이아웃을 효과적으로 관리하고, 각각의 페이지를 모듈화하여 재사용성을 높였습니다.

* 페이징 및 검색 기능:
  * 목록을 페이징하여 보여주고, 검색 기능을 추가하여 사용자가 필요한 정보를 빠르게 찾을 수 있도록 구현했습니다.
  
<br/>

 ##  회원, 관리자(User, Admin)
    - 회원 : 회원가입 및 탈퇴 / 로그인 및 로그아웃 / 내정보 구현
 👉🏻 *회원가입* / *로그인*
 ![회원가입,로그인](https://github.com/HbMagpie/AGU/assets/118106602/74f4f655-92bd-4ba6-8929-d222f0698dd2)
 👉🏻 *내정보 수정*
 ![내정보 이름변경](https://github.com/HbMagpie/AGU/assets/118106602/966a3ac8-bf99-4d65-9c81-a829f0735e89)
 ![내정보 주소변경](https://github.com/HbMagpie/AGU/assets/118106602/f43ee83f-4c8b-44a5-a894-290cc60905cf)
 <br/> <br/> <br/> 
    
    - 관리자 : 관리자로 로그인 했을 경우에만 보이는 메뉴 구현(회원 관리, 상품 등록 / 삭제 / 주문 관리 / 공지사항)
 <br/><br/>  👉🏻 *관리자로그인* / *회원관리* / *공지*
  ![관리자로그인,공지](https://github.com/HbMagpie/AGU/assets/118106602/2e077bb2-eed4-4048-b8ee-4dd2a722ab4f)
 👉🏻 *상품등록*
  ![상품등록_최종](https://github.com/HbMagpie/AGU/assets/118106602/092d2403-bbe9-40d1-b661-c9e80f8d9b6b)
 👉🏻 *주문 관리*
  ![관리자 주문현황,주문취소](https://github.com/HbMagpie/AGU/assets/118106602/ccdc277c-a8f4-4f22-8bc5-e2e7797d7a3f)


<br/> <br/> 
 ## 상품(product)
    - 상품 등록 / 삭제 / 구매 / 리뷰 기능 구현
   👉🏻 *리뷰*
![리뷰](https://github.com/HbMagpie/AGU/assets/118106602/f29b068d-95c4-43fc-8440-b4d54d057539)
<br/> <br/> 
 ##  장바구니(Cart)
    - 장바구니 담기 / 장바구니 조회 / 장바구니 삭제 구현
![장바구니, 주문](https://github.com/HbMagpie/AGU/assets/118106602/4a970681-acaf-4191-8a62-c0b676e4512b)
<br/> <br/> <br/>     
 ##  결제(Order)
    - 주문 / 결제 API활용
![결제](https://github.com/HbMagpie/AGU/assets/118106602/97d70e7c-cfb2-4c79-8c60-7ec32aa481b8)
<br/> <br/> <br/>     
 ## 검색(Search)
    - 키워드 검색 / 카테고리 검색 기능 구현
![카테고리,검색](https://github.com/HbMagpie/AGU/assets/118106602/30c544ec-4cdd-45fa-8fb5-c9760e61743f)
<br/> <br/>     
 ##  게시판(Notice, FAQ)
    - CRUD 게시판 구현
    - 페이징처리 구현
    - 관리자만 공지사항, 답변 기능 부여
![FAQ질문](https://github.com/HbMagpie/AGU/assets/118106602/6f9c3727-b888-4786-8b53-5c0793523329)
 👉🏻 *관리자 답변등록,수정*
![FAQ 관리자답변등록](https://github.com/HbMagpie/AGU/assets/118106602/03da8314-7b1f-49c3-911f-859e9efa880f)
![FAQ답변수정](https://github.com/HbMagpie/AGU/assets/118106602/a2097c86-27eb-443c-8880-27546ed84833)
 👉🏻 *질문삭제시 답변도 함께 삭제*
![FAQ질문자 질문삭제](https://github.com/HbMagpie/AGU/assets/118106602/e8977b41-8a77-4126-bb1b-76811a943130)


