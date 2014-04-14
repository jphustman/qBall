<<<<<<< HEAD
/**
 * I am the question controller.
 * @accessors = true
 */
component {

    property questionService;

    function init(fw) {
        variables.fw = fw;
    }

    //Used by a few methods to validate/load a question
    private function loadQuestion(any rc) {
        if(!structKeyExists(rc, "questionid") ||
                    !isNumeric(rc.questionid) ||
                            rc.questionid <= 0) {

            variables.fw.redirect("main.default");
        }

        rc.question = questionService.get(rc.questionid);

    }

    function list(any rc) {

        /*if (!structKeyExists(session, "isLoggedIn")) {
            rc.errors = "You are not logged in";
            variables.fw.redirect("main.default", "errors");
        }*/
        if(structKeyExists(rc, "start") && (!isNumeric(rc.start) ||
                            rc.start <= 0 || round(rc.start) != rc.start)) {

            rc.start = true;
        }
    }

    function post(any rc) {
        writeDump(rc);abort;
        rc.errors = [];
        if(!len(trim(rc.title))) {
            arrayAppend(rc.errors, "You must include a title for your question.");
        }

        if(!len(trim(rc.text))) {
            arrayAppend(rc.errors, "You must include text for your question.");
        }

        if(arrayLen(rc.errors)) {
            variables.fw.redirect("question.new", "title,text,errors");
        }

        //Right now we assume the post just worked
        writeDump(rc);abort;
        rc.questionid = rc.data.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function postAnswer(any rc) {
        loadQuestion(rc);

        rc.answer = trim(htmlEditFormat(rc.answer));

        //Right now we assume the post just worked
        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function selectAnswer(any rc) {
        loadQuestion(rc);

        if(!structKeyExists(rc, "user") || rc.user.getId() != rc.question.getUser().getID()) variables.fw.redirect("main.default");

        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function view(any rc) {
        loadQuestion(rc);
    }

    function voteAnswerDown(any rc) {
        loadQuestion(rc);

        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function voteAnswerUp(any rc) {
        loadQuestion(rc);

        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

}
=======
/**
 * I am the question controller.
 * @accessors = true
 * @output = false
 */
component {

    property questionService;

    function init(fw) {
        variables.fw = fw;
    }

    //Used by a few methods to validate/load a question
    private function loadQuestion(any rc) {
        if(!structKeyExists(rc, "questionid") || !isNumeric(rc.questionid) ||
                            rc.questionid <= 0) {

            variables.fw.redirect("main.default");

        }
        rc.question = questionService.get(rc.questionid);
    }

    function list(any rc) {
        if (!structKeyExists(rc, "authenticated")) {
            rc.errors = "You are not logged in";
            variables.fw.redirect("main.default", "errors");
        }
        if(structKeyExists(rc, "start") && (!isNumeric(rc.start) ||
                            rc.start <= 0 || round(rc.start) != rc.start)) {

            rc.start = true;
        }
    }

    function startPost(any rc) {
        rc.errors = [];
        if(!len(trim(rc.title))) arrayAppend(rc.errors, "You must include a title for your question.");
        if(!len(trim(rc.text))) arrayAppend(rc.errors, "You must include text for your question.");

        if(arrayLen(rc.errors)) {
            variables.fw.redirect("question.new", "title,text,errors");
        }
    }

    function endPost(any rc) {
        //Right now we assume the post just worked
        rc.questionid = rc.data.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function startPostAnswer(any rc) {
        loadQuestion(rc);

        rc.answer = trim(htmlEditFormat(rc.answer));

    }

    function endPostAnswer(any rc) {
        //Right now we assume the post just worked
        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function startSelectAnswer(any rc) {
        loadQuestion(rc);

        if(!structKeyExists(rc, "user") || rc.user.getId() != rc.question.getUser().getID()) variables.fw.redirect("main.default");
    }

    function endSelectAnswer(any rc) {
        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function startView(any rc) {
        loadQuestion(rc);
    }

    function startVoteAnswerDown(any rc) {
        loadQuestion(rc);
    }

    function endVoteAnswerDown(any rc) {
        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function startVoteAnswerUp(any rc) {
        loadQuestion(rc);
    }

    function endVoteAnswerUp(any rc) {
        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

}
>>>>>>> f761099fe0ebb71971568effb98210adf597376f
