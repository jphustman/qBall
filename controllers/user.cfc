component {

	function getUserService() { return variables.userService; }
	function setUserService(any userservice) {
		variables.userService = arguments.userservice;
	}

	function init(fw) {
		variables.fw = arguments.fw;
	}
	
	function checkAuthorization(any rc) {
		rc.authenticated = structKeyExists(session, "userid");
		if(rc.authenticated) rc.user = getUserService().get(session.userid);
	}

	function startAuthenticate(any rc) {		
		rc.loginerrors = [];
		if(!len(trim(rc.username))) arrayAppend(rc.loginerrors, "You must include a username.");
		if(!len(trim(rc.password))) arrayAppend(rc.loginerrors, "You must include a password.");
		
		if(arrayLen(rc.loginerrors)) {
			variables.fw.redirect("user.login", "username,loginerrors");
		} 
	}

	function endAuthenticate(any rc) {
		if(!structKeyExists(rc, "data")) {
			rc.loginerrors[1] = "Your login failed.";
			variables.fw.redirect("user.login", "username,loginerrors");			
		} else {
			//Result is a user entity, but we only persist the ID
			session.userid = rc.data.getId();
			variables.fw.redirect("main.default");
		}		
		
	}
	
	function startLogout(any rc) {
		structDelete(session, "userid");
		variables.fw.redirect("main.default");
	}
	
	function startRegister(any rc) {		
		rc.registererrors = [];
		if(!len(trim(rc.username))) arrayAppend(rc.registererrors, "You must include a username.");
		if(!len(trim(rc.password))) arrayAppend(rc.registererrors, "You must include a password.");
		if(rc.password2 != rc.password) arrayAppend(rc.registererrors, "Your confirmation password did not match.");
		if(!isValid("email", rc.email)) arrayAppend(rc.registererrors, "You must include a valid email address.");
		
		if(arrayLen(rc.registererrors)) {
			variables.fw.redirect("user.login", "username,email,registererrors");
		} 
	}

	function endRegister(any rc) {
		if(isSimpleValue(rc.data)) {
			rc.registererrors[1] = rc.data;
			variables.fw.redirect("user.login", "username,email,registererrors");			
		} else {
			//Result is a user entity, but we only persist the ID
			session.userid = rc.data.getId();
			variables.fw.redirect("main.default");
		}
	}
	
}