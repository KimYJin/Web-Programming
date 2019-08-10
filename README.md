# Web-Programming
create Web Site where students can organize study groups efficiently <br>
### Gachon Study Group Web
<img src="https://user-images.githubusercontent.com/23073504/62825150-10c72380-bbe2-11e9-92a5-a41276bffaf0.png" width="80%"></img>
<br><br>
### 1. Idea
- Studying in the study group is more efficient than studying alone.
- It is difficult to  find study members who have same learning goals.
- So, I decided to create a Web Site where students can organize study groups efficiently
<br><br>
### 2. Details <br>
### 2-1. Main page (Home)<br>
(1) View study group list   <br>
-index.jsp : Get all study group lists from the database. Users are expected to find it difficult to add pictures separately, so the picture that match the title is randomly taken from the unlash site and displayed.
<br><br>
(2) Search particular study group
- index.jsp : Enter the study name you want to search for and click ‘Search’ button, pass the search value to the parameter of the name ‘search’.
- search.jsp : Search DataBase for a study group title that matches the keyword that was handed over to the parameter from index.jsp and display the results if there is a matching study group.
<br><br>
### 2-2. Create new study page<br>
<img src="https://user-images.githubusercontent.com/23073504/62825214-36a0f800-bbe3-11e9-9e86-cbae8b80793c.png" width="70%"></img>
- craete.html : If click ‘Make New Study’ button, then open the create.html screen. If creator enters details of new study and own information, the values are passed to index.jsp by form element.
- Index.jsp : Add new study details and creator information handed over to the parameter from create.html to study-table member-table of the database.
<br><br>
### 2-3. Show Study Group details & Join Study<br>
<img src="https://user-images.githubusercontent.com/23073504/62825217-3a347f00-bbe3-11e9-9195-6626b2154be4.png" width="70%"></img>
- If the number of member is full or recruitment period is expired, ‘Register’ button for new members is change by using JQuery to blocking gray button
- detail_request.jsp: When you click a specific study group, study details is forwarded to detail_request.jsp. Show details and list of all members of the study in the Database.
- detail_request.jsp : If you want to join study, write your name, student ID, and Kakao ID and click ‘Register’ button. You can see your information is added to Member List.
<br><br>
### 3. Development Environment & Tool
• Database – Firebase
• Tomcat
• JQuery, AJAX, JSP, HTML, JS
• Design - CSS, Bootstrap
