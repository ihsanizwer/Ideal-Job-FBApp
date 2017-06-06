<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Lobster+Two" rel="stylesheet">
    <style>
        body{
            font-family: 'Lobster Two', cursive;
        }
        #load{

        }
    </style>
    <title>Generate your profile statistics!</title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#goButton").click(makeRequest);
        });
        function makeRequest() {
            var showdiv = document.getElementById('showLoad');
            var hide = document.getElementById('hide');
            hide.style.display = 'none';
            showdiv.style.display ='block';
// Define properties
            var AUTH_ENDPOINT = "https://www.facebook.com/dialog/oauth";
            var RESPONSE_TYPE = "code";
            var CLIENT_ID = "932702550203248";
            var REDIRECT_URI = "http://ec2-34-210-226-241.us-west-2.compute.amazonaws.com:8080/facebookapp/callback";
            var SCOPE = "public_profile user_posts user_photos";
// Build authorization request endpoint
            var requestEndpoint = AUTH_ENDPOINT + "?" +
                    "response_type=" + encodeURIComponent(RESPONSE_TYPE) + "&" +
                    "client_id=" + encodeURIComponent(CLIENT_ID) + "&" +
                    "redirect_uri=" + encodeURIComponent(REDIRECT_URI) + "&" +
                    "scope=" + encodeURIComponent(SCOPE);
// Send to authorization request endpoint
            window.location.href = requestEndpoint;
        }
    </script>
</head>
<body>
<div align="center">
    <img src="images/button_likatite.png">
<h1>Get your profile rated!</h1>
    <div id="hide" style="display:block ">
    Likatite will analyze your profile and rate it. Here's what we'll do.
    <br>
    <br>

        Find how many times you posted in facebook<br>
        Find the total amount of likes for all your posts<br>
        Find the average number of likes per post<br>
        Find the most liked post of yours<br>
        Find how many people liked your most liked post<br>
        Find the total number of comments on your posts<br>
        Find the average number of comments per post<br>
        Rate your profile based on the info we found (Kids/Men/Legends)</br>
        <br>
        <br>
    <br>
    Click on the button below to get started with facebook.
        <br>
    </div>
</div>

<div id="showLoad" align="center" style="display: none">
    <img src="images/loading.gif" id="load">
    <br>
    <br>
    Please be patient while Likatite analyze your profile. It may take some time to analyze as it analyzes your entire timeline.
</div>

<br/>
<br/>

<div align="center">
    <button id="goButton" type="button"><img src="images/button.png"/></button>
</div>


<br>
<a target="_blank" href="http://privacypolicies.com/privacy/view/bUrnLd">Privacy policy</a>

<br>

</body>
</html>
