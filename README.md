# COCKTAILER
>럼 소개 및 칵테일 관련 체험행사 예약 사이트  
>http://3.35.27.188:8080/cocktailer/  

</br>

![siteLayoutImg](https://user-images.githubusercontent.com/85478918/151158178-5acbafdd-9165-4595-b6fd-41322eb7631a.png)

## 개발 목표
* 럼 선택필터 구현을 통한 JS, CSS, HTML 이해
* 게시판 구현을 통한 사용자 요청에 따른 프론트, 백엔드 서비스 흐름 이해

</br>

## 제작 기간
* 5차(2022/11/25 ~ 2022/11/30) : 기존 코드 최적화, AWS를 통한 배포 (현재)
* 4차(2022/01/20 ~ 2022/02/20) : 기존 코드 최적화, heroku를 통한 배포 [🔍](https://github.com/a11chan/cocktailer_0.3)
* 3차(2022/01/10 ~ 2022/01/23) : HTML 기반 프로젝트를 JSP로 변환 및 게시판 구현 [🔍](https://github.com/a11chan/cocktailer_0.2)
* 2차(2021/09/19 ~ 2021/09/29) : 다른 서브페이지(sub2.html, sub3.html) 통합 [🔍](https://github.com/a11chan/cocktailer_0.1)
* 1차(2021/09/16 ~ 2021/09/30) : 담당 정적 페이지(sub1.html) 1차 완성 및 구현 [🔍](https://github.com/a11chan/cocktailer_0)

</br>

## 프로젝트 담당 영역
#### `3차 이후`
* 팀원 진로변경(백엔드→프론트엔드)에 따른 개인프로젝트로 전환
* EXPERIENCES(sub3.jsp) 중 입력 폼
* 예약 게시판 및 관리자 페이지
* 기존 코드 최적화 및 AWS 배포

#### `1차 ~ 2차`
* OUR RUMS(sub1.jsp)
* 본인 포함 총 4인 진행

</br>

## 사용 기술
#### `Back-end`
* Java 11
* Maven 3.8.0
* MySQL 8.0.28
#### `Front-end`
* jQuery 1.12.4
* Bootstrap 5.1.3

</br>

## 개발 환경
* IntelliJ Ultimate 2022.2.4
* Spring Tool Suite 3.9.9
* Eclipse 2021-09 4.21.0
* VS CODE 1.74.2
* Windows 10 Pro

</br>

## 프로젝트 규모
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6ba59ab1-e73a-4b71-a9e5-ed24cd54c7da%2FUntitled.png?table=block&id=29d40b66-55ca-42bf-83c2-7159409e56a8&spaceId=d45b6527-cc9f-4af9-b7e8-975463d8b2e5&width=2000&userId=504d5d0d-ce4c-40f0-8ccd-2a8fd23e22dc&cache=v2)

</br>

## 주요 기능
<details>
<summary>
jQuery를 활용한 Taste Filter 구현  
</summary>
<div markdown="1">

![rumFilterPreview](https://user-images.githubusercontent.com/85478918/154827446-14fdfecf-bd54-488c-8d38-eda1e770a6f6.gif)   
  ~~~javascript
    let tasteName = $(".submenu input");
    tasteName.click(function(){
        $.fn.makePickedItemSelector();
        $.fn.hidePickedItemAndTasteName();
        $(pickedItemSelector).show();
        $.fn.showNoseChevron();
        $.fn.showPalateChevron();
        $.fn.showFinishChevron();
        $.fn.showTypeChevron();
        $.fn.clearForm();
    });
    
    $.fn.applyRadioBtnEffect = function(){
        this.click(function(){
            $('input[name="taste"]').not(this).prop("checked", false);
        });
    };
    $("#noseBtn").applyRadioBtnEffect();
    $("#palateBtn").applyRadioBtnEffect();
    $("#finishBtn").applyRadioBtnEffect();
    $("#typeBtn").applyRadioBtnEffect();
  ~~~

</br>

</div>
</details>

<details>
<summary>Bootstrap을 활용한 입력폼 구현</summary>
<div markdown="1">

![apply](https://user-images.githubusercontent.com/85478918/154830287-cd4aded2-69ce-4981-91d0-0c96aa0f464e.gif)   
~~~html
  <form class="app-form" method="post" action="/board/postProc.jsp">
  
      <div class="radioBox btn-group mb-2">
          <input type="radio" name="event" id="cClass" value="칵테일 클래스"
              class="btn-check" autocomplete="off" checked>
          <label for="cClass" class="btn btn-outline-secondary">칵테일 클래스</label>
          <input type="radio" name="event" id="fTour" value="럼 공장 투어"
              class="btn-check" autocomplete="off">
          <label for="fTour" class="btn btn-outline-secondary">럼 공장 투어</label>
          <input type="radio" name="event" id="rTasting" value="럼 시음 투어"
              class="btn-check" autocomplete="off">
          <label for="rTasting" class="btn btn-outline-secondary">럼 시음 투어</label>
      </div>
  
      <div class="inputSet1">
          <div class="inputSet">
              <input type="text" name="name" placeholder="신청자 닉네임(한글 또는 영문)"
                  pattern="^[가-힣a-zA-Z]+$" required class="form-control mb-2" />
          </div>
          <div class="inputSet">
              <input type="tel" name="tel" placeholder="연락처 입력" maxlength="13"
                  required class="form-control mb-2" />
          </div>
      </div>
~~~

</br>

</div>
</details>


<details>
<summary>JSP 예약 관리 게시판 구현</summary>
<div markdown="1">

![crud](https://user-images.githubusercontent.com/85478918/154832049-183a8cd5-b0cc-4f21-a2a9-60910f9e991a.gif)   

[코드 보기 🔍](https://github.com/a11chan/cocktailer_1.0/blob/49b331da14a59999756fc5e31fe1eb8909f431f5/WebContent/board/list.jsp)

</br>

</div>
</details>

<details>
<summary>관리자 모드 구현</summary>
<div markdown="1">

![admin](https://user-images.githubusercontent.com/85478918/154832033-676f5ca8-85a9-4bec-8e19-2ac3cc878b94.gif)
[코드 보기 🔍](https://github.com/a11chan/cocktailer_1.0/blob/49b331da14a59999756fc5e31fe1eb8909f431f5/WebContent/board/replyProc.jsp)

</br>

</div>
</details>

</br>

## 트러블 슈팅  
* [문제해결 모음 링크🔍](https://allchan.notion.site/COCKTAILER-5-5480abb6960d44c2a6e00e418d3726bc)
