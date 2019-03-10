<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="jk">

    <title>Gachon Study Maker</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
      <link href="css/request.css" rel="stylesheet">
       <link href="css/landing-page.min.css" rel="stylesheet">  
 
  </head>

  <body style="background-color:#F8F9FA;">
 
    <!-- Navigation -->
    <nav class="navbar navbar-light bg-light static-top" style="margin: 15px 1px 15px 1px;">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Gachon Study Maker</a>
        <a class="btn btn-primary" href="create.html">Make New study</a>
      </div>
    </nav>
  
  <!-- from index.jsp -->
  <%  String title = request.getParameter("title"); 
  String memberNum = request.getParameter("memberNum");
  String closeDate = request.getParameter("closeDate");
  String content = request.getParameter("content"); %>
  
  <!-- from # after click 'Register' --> 
  <%
  String name = request.getParameter("name");
  String kakaoID = request.getParameter("kakaoID");
  String studentID = request.getParameter("studentID");
  %>

<div class="container register">
    <div class="row">
        <div class="col-md-6 register-left" style="text-align: center">
            <script type="text/javascript" src="js/countingdown.js"></script>
            
            <!-- detail of study -->
            
           <h1 id="title"></h1>
           <h6 id="content"></h6><br/><br/>    
           <h5 id="memberNum">Number of study participants : </h5><br/>
           <h5 id="closeDate">Study Dead line : </h5>
            <ul>
                <li><span id="days"></span>days</li>
                <li><span id="hours"></span>Hours</li>
                <li><span id="minutes"></span>Minutes</li>
                <li><span id="seconds"></span>Seconds</li>
            </ul>
            
   
            <!-- member list -->
            
            <h4>Member List</h4>
           
			<span id="memberList"> </span><br/>
        </div>

        <div class="col-md-6 register-right static-top">
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                   <h3 class="register-heading">Apply to Study</h3>
                    <br/>
                    <form action="detail_request.jsp">
                    <div class="row register-form">
                        <div class="col-md-11 my-auto">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" placeholder="Name *" value="" /><br/>
                            </div>
                            
                            <div class="form-group">
                                <input type="text" name="studentID" class="form-control" placeholder="Student ID *" value="" /><br/>
                            </div>
           
                            <div class="form-group">
                                <input type="text" name="kakaoID" class="form-control"  placeholder="Kakao ID *" value="" /><br/>
                            </div>
                         
                             
                            <!-- 새로고침 할 때 index.jsp에서 넘어온 request 유지하도록.. -->
                            <input type="hidden" name="title" value="<%=title %>">
							<input type="hidden" name="content" value="<%=content%>">
							<input type="hidden" name="closeDate" value="<%=closeDate%>">
							<input type="hidden" name="memberNum" value="<%=memberNum%>">
							
							
                            <input type="submit" id="register" value ="Register" class="btn btn-block btn-lg btn-primary"/>
                            <span id="span1" style="color:red"></span>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
  <!-- Footer -->
<footer class="footer bg-light" style="margin: 20px 1px 20px 1px;">
    <div class="container">
        
    </div>
</footer>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.5.8/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyBWxWPMx03teCUuLwG0db4Ay9xuXnm39V0",
    authDomain: "gachonstudymaker.firebaseapp.com",
    databaseURL: "https://gachonstudymaker.firebaseio.com",
    projectId: "gachonstudymaker",
    storageBucket: "gachonstudymaker.appspot.com",
    messagingSenderId: "490179660109"
  };
  firebase.initializeApp(config);
  var database = firebase.database();
  var studyRef = database.ref('study/'); 
  var memeberRef = database.ref('member/');
  var num=0;

//show detail of study group
  <%
  if(title!=null)
  {%>
    $("#title").append("<%=title %>");
    $("#content").append("<%=content %>");
    $("#memberNum").append("<%=memberNum%>");
    $("#closeDate").append("<%=closeDate%>");

  <%}%>
  
  
//join 버튼 누르고나면 memeber database에 추가
<%if((title !=null) && (name!=null) && (kakaoID!=null) && (studentID!=null))
  {%>
     <%if(!(title.trim().equals("")) && !(name.trim().equals(""))&& !(kakaoID.trim().equals(""))&& !(studentID.trim().equals("")))
     {%>
         memeberRef.push({"title" : "<%=title%>", "name": "<%=name%>", "kakaoID": "<%=kakaoID%>", "studentID":"<%=studentID%>"});
     <%}%>  
  <%}%>
  
//show member list  
  memeberRef.orderByChild("title").equalTo("<%=title%>").on("child_added", function(data) {	
        var memberData=data.val();
        var name = memberData.name;
        var kakaoID = memberData.kakaoID;
        var studentID = memberData.studentID;
        var html="Name: "+name+"<br/>studnetID: "+studentID +"<br/>KakaoID: "+kakaoID +"</br><br/>";
      $("#memberList").append(html);
     	 num++;
     	 
     	  //String을 integer로 
     	  var total = <%=memberNum%>;
     	  total *=1;
     	  $("span1").text("The recruitment is closed..");
     	  if(num>=total)
     	  {
     		 $("#register").attr('value', "Block");
     		 $("#register").prop('disabled', true);
     		 $("#register").attr('style', "background-color:#3D3D3D;");
     		 $("#span1").text("Member recruitment is closed..");
     	   }
     });
    
	 
</script>
</body>
</html>