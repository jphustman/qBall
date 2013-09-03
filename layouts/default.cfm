<cfparam name="rc.pagetitle" default="QBall">

<cfoutput>
<html>

<head>
<title>#rc.pagetitle#</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body>

<div id="header">
<a href="index.cfm">Home</a> - 
<a href="?#framework.action#=question.list">Questions</a> -
<cfif not rc.authenticated>
<a href="?#framework.action#=user.login">Login/Register</a>
<cfelse>
<a href="?#framework.action#=question.new">Ask a Question</a> -
<a href="?#framework.action#=user.logout">Logout</a> - Welcome, #rc.user.getUsername()#
</cfif>
</div>

<div id="body">
#body#
</div>

</body>
</html>
</cfoutput>

<!--- Used while I was debugging, will make it an option later so I can toggle an app var and show this
<cfif 0>
<br/><br/><br/>
<cfdump var="#rc#" label="RC" expand="false">
</cfif>
--->