<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공통 디자인"
    isELIgnored="false"
    %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             선택
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${empty sessionScope.user_id?'#void':'http://localhost/jsp_prj/calendar/calendar.jsp'}">일정관리</a>
          <a class="dropdown-item" href="#">리스트보기</a>
          <a class="dropdown-item" href="http://localhost/jsp_prj/day0729/include_a.jsp">인크루드연습</a>
         </div>
      </li>
        <li class="nav-item">
       <a class="nav-link" href="http://localhost/jsp_prj/day0803/car_list.jsp">자동차 목록</a>
    </ul>
  </div>
</nav>
         

   