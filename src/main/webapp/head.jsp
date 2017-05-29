<%@ page language="java"
	import="java.util.*,com.sh.dao.*,com.sh.model.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sh.dao.impl.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%!List<Kind> listKind;
%>
	<%
  KindDAO kd = new KindDAOImpl();
  listKind = kd.findAll();
  session.setAttribute("listKind", listKind);
%>
<div class="container">
	<c:if test="${not empty sessionScope.user }">
		<a href="#">当前用户:${sessionScope.user.username}</a>
		<a href="#" onclick="logout()">注销</a>
		<a href="cart.jsp">购物车</a>
		<a href="order_list.jsp">订单</a>
		<a href="user_product.jsp">发布商品</a>
		<a href="requestOrder.jsp">订单请求</a>
	</c:if>
	<c:if test="${ empty sessionScope.user }">
		<a href="login.jsp">登录</a>
		<a href="register.jsp ">注册</a>
	</c:if>
</div>

<!--创建menuDIV--导航条-->
<div class="container-fluid">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">

				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand active" href="index.jsp">首页<span class="sr-only">(current)</span></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				    <c:forEach var="kind" items="${sessionScope.listKind}">
				      <li><a href="product_list_by_kid.jsp?kid=${kind.id}" >${kind.kname}</a></li>
				    </c:forEach>
				</ul>
				<div class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input id="searchText" type="text" class="form-control" placeholder="Search">
					</div>
					<a href="JavaScript:;" onclick="location ='search.jsp?name='+document.getElementById('searchText').value;"><button type="submit" class="btn btn-default">搜索</button></a>
				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</div>
<script>
    function logout() {
        $.ajax({
            type: "GET",
            url: "api/user/logout",
            dataType: "json",
            success: function (response) {
                if (response.status === 0) {
                    //注销失败
                    swal({
                        title: '提示',
                        text: response.data,
                        timer: 3000
                    }).then(
                        function autoReturn() {
                            location.href = response.autoReturn
                        }
                        // handling the promise rejection
//                        function (dismiss) {
//                            setTimeout(autoReturn)
//                            if (dismiss === 'timer') {
//                                console.log('I was closed by the timer')
//                            }
//                        }
                    )
                }else{
                    location.href = response.autoReturn;
                }
            }
        })
    }
</script>