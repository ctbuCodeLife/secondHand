
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提示页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/info.css" rel="stylesheet" >
</head>
<body>
<%@include file="head.jsp" %>
<div class="loginBoole">
    <p>
        ${sessionScope.msg}
        <br>
        如果您的浏览器没有自动跳转，<a href="${sessionScope.autoReturn}">请点击这里</a>
    </p>
</div>
<footer class="navbar-fixed-bottom">
    <%@include file="footer.jsp" %>
</footer>
</body>
<script type="text/javascript">
    function jumpurl(){
        location='${sessionScope.autoReturn}';
    }
    setTimeout('jumpurl()',3000);
</script>
</html>
