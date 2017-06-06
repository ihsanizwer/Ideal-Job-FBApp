<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.GsonBuilder" %>
<%@ page import="com.tharindu.oauth.facebookapp.data.ResourceDataHolder" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.restfb.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.restfb.types.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Lobster+Two" rel="stylesheet">
    <title>Title</title>
    <style>
        body{
            font-family: 'Lobster Two', cursive;
            background-image: url("images/facebook-reac4.jpg");
            text-align: center;
        }
        #main{
            text-decoration: double;
            font-size: 30px;
            text-align: center;
        }
        #nm{
            text-decoration: double;
            font-size: 32px;
            text-align: center;
        }
    </style>
</head>
<body>
<div align="center">
<img src="images/button_likatite.png">
    <h1>We have got your results!</h1>
</div>
<div id="main">
<%

    String key = (String) request.getParameter("key");

    String user_resource = ResourceDataHolder.getInstance().getResource(key);

    FacebookClient fbClient = new DefaultFacebookClient(user_resource);

    Connection<Post> result = fbClient.fetchConnection("me/feed",Post.class);

    int pstNo =0;
    Long totLikes =0l;
    int averageLikes;
    Long totComments= 0l;
    Long mostLiked = 0l;
    String mostLikedId ="";
    int averageComments;
    String rating;
    String name ="";


    try{
        User user = fbClient.fetchObject("me", User.class);
        name = user.getName();
    }catch(Exception ex){}


    for(List<Post> pg: result){
        for(Post pst: pg){
            try {
                Post.Likes pstLike = fbClient.fetchObject(pst.getId() + "/likes", Post.Likes.class,
                        Parameter.with("summary", 1), Parameter.with("limit", 0));

                totLikes = totLikes + pstLike.getTotalCount();


                if (pstLike.getTotalCount() > mostLiked) {
                    mostLikedId = pst.getId();
                    mostLiked = pstLike.getTotalCount();
                }
            }catch (Exception f){}
            try {
                Post.Comments pstCmt = fbClient.fetchObject(pst.getId() + "/comments", Post.Comments.class,
                        Parameter.with("summary", 1), Parameter.with("limit", 0));
                totComments = totComments + pstCmt.getTotalCount();
                pstNo++;
            }catch(Exception e){}
        }
    }



    averageLikes = (int)(totLikes/pstNo);
    averageComments = (int)(totComments/pstNo);

    if(averageLikes < 50 && averageLikes < 100){
        rating = "Kids";
    }else if(averageLikes < 100){
        rating = "Men/Women";
    }else{
        rating = "Legend";
    }

    String output = "Number of posts: "+pstNo;
    String output2 = "Total number of Likes: "+totLikes;
    String output3 = "Average Likes per post: "+averageLikes;
    String output4 = "Total comments on your posts :"+totComments;
    String output5 = "Average number of comments per post: "+averageComments;
    String output6 = "Most liked post number of Likes: "+mostLiked;
    String output7 = "Most Liked post : ";
    String output8 = "Overall profile rating (Kids/Mens/Legends): "+ rating;

    try{
        FacebookType response2 = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message","Discovered my profile stats through Likatite, you can too! http://bit.ly/2r1xPac Total posts :"+pstNo+". Total likes : "+totLikes+". Total Comments : "+totComments+"My rating :"+rating));
    }catch(Exception g){}
%>
<%=name%>
<br><%=output%>
<br><%=output2%>
<br><%=output3%>
<br><%=output4%>
<br><%=output5%>
<br><%=output6%>
<br><%=output7%><a href="https://www.facebook.com/<%=mostLikedId%>" target="_blank">Click Here to visit<a/>
<br><%=output8%>
<br>(These details will be automatically shared on your timeline, if you authorized the app to update statuses earier.)
</div>
<br>
<h2>Do you think I did a great job :) Then please endorse me for OAuth on <a href="https://lk.linkedin.com/in/ihsanizwer" target="_blank">LinkedIn</a></h2>
</body>
</html>
