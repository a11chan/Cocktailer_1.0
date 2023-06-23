# COCKTAILER
### 개요
* 상품(럼) 소개 및 칵테일 관련 체험행사 예약 사이트
* Bootstrap, jQuery를 통한 UI 구현
* JSP Model 1 구조
* DEMO Site: https://bit.ly/3XcqtfU

![siteLayoutImg](https://user-images.githubusercontent.com/85478918/151158178-5acbafdd-9165-4595-b6fd-41322eb7631a.png)

### 트러블슈팅

<details>
<summary>404 에러 페이지 구현을 통한 사용자 경험 개선</summary>
<div markdown="1">

* 이슈: 존재하지 않는 페이지 요청 시 에러 메시지만 출력하여 사용자가 어떻게 해야 할지 알 수 없음
* 원인: 상황에 맞는 예외 처리 로직 부재
* 해결 과정
  * 남궁성 님의 스프링의 정석 강의를 참고하여 web.xml에서 HttpStatus 별로 에러 페이지 설정 가능 확인
  * 에러 상황에 대한 설명과 정상 페이지로 가는 안내를 사이트 분위기에 맞게 제공할 수 있도록 구현
* 결과: 에러 상황 후 다음 행동에 대한 안내를 통해 피드백을 받거나 사이트 체류 유도

</div>
</details>

<details>
<summary>리펙터링을 통한 기존 코드 개선</summary>
<div markdown="1">

* 계기: 클린 코드 독서 스터디 중에 2장 의미 있는 이름, 3장 함수 부분을 읽으며 프로젝트 코드 반성
* 원인: 다른 사람이 봐도 이해하기 쉽게 충분한 정보를 제공하지 못한 코드 작성
* 적용 과정
  * 주석 대신 어떤 일을 하는지 함수 이름으로 표현하도록 수정
  * 1개의 함수는 1가지 기능만 하도록 정의, 중복된 로직을 함수로 추출하여 호출
* 결과: 코드 가독성 향상 및 12라인 축소

</div>
</details>

<details>
<summary>그 외 이슈</summary>
<div markdown="1">

Notion 저장소: https://bit.ly/46j0MhQ

</div>
</details>

### 핵심 로직

<details>
<summary>조건별 상품 필터링</summary>
<div markdown="1">
  <img src="https://user-images.githubusercontent.com/85478918/154827446-14fdfecf-bd54-488c-8d38-eda1e770a6f6.gif" style="width:400px"/>

* 뷰 페이지(sub1.jsp): https://bit.ly/46mUvC3
* 필터링 로직(sub1.js): https://bit.ly/3pbZ2GJ

</div>
</details>

<details>
<summary>예약 관리 게시판</summary>
<div markdown="1">

<img src="https://user-images.githubusercontent.com/85478918/154832049-183a8cd5-b0cc-4f21-a2a9-60910f9e991a.gif" style="width:400px"/>

* 관리자 비밀번호(P@ssw0rd) 입력 시 조회/수정 가능  
* 뷰 페이지(list.jsp): https://bit.ly/3pk5fQQ
* DB 접근 로직(BoardMgr.java): https://bit.ly/3CGm9wa

</div>
</details>

### 담당 영역

<details>
<summary>3차~5차</summary>
<div markdown="1">

* 팀원 진로변경(백엔드→프론트엔드)에 따른 1인 프로젝트로 전환
* 기존 코드 최적화 및 AWS 배포
  * 5차(2022/11/25 ~ 2022/11/30) : 기존 코드 최적화, AWS를 통한 배포 (현재)
  * 4차(2022/01/20 ~ 2022/02/20) : 기존 코드 최적화, heroku를 통한 배포 [🔍](https://github.com/a11chan/cocktailer_0.3)
  * 3차(2022/01/10 ~ 2022/01/23) : HTML 기반 프로젝트를 JSP로 변환 및 게시판 구현 [🔍](https://github.com/a11chan/cocktailer_0.2)

</div>
</details>

<details>
<summary>1차~2차</summary>
<div markdown="1">

* 디자인 통일성 준수를 위한 UI 색상 가이드 제안 및 적용
* 본인 포함 총 4인 진행
  * 2차(2021/09/19 ~ 2021/09/29) : 다른 서브페이지(sub2.html, sub3.html) 통합 [🔍](https://github.com/a11chan/cocktailer_0.1)
  * 1차(2021/09/16 ~ 2021/09/30) : 정적 페이지(sub1.html) 1차 완성 및 구현 [🔍](https://github.com/a11chan/cocktailer_0)
  
</div>
</details>

### 사용 기술
* Java 11
* MySQL 8.0.28
* Maven 3.8.0
* jQuery 1.12.4
* Bootstrap 5.1.3

### 향후 계획
* Spring Boot, JPA 프로젝트로 전환  
* JavaScript, CSS 최적화
