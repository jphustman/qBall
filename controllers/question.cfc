/**
 * I am the question controller.
 * @accessors true
 */
component {

    property questionService;

    function init(fw) {
        variables.fw = fw;
    }

    //Used by a few methods to validate/load a question
    private function loadQuestion(rc) {
        if(!structKeyExists(rc, "questionid") ||
                    !isNumeric(rc.questionid) ||
                            rc.questionid <= 0) {

            variables.fw.redirect("main.default");
        }

        rc.question = questionService.get(rc.questionid);

    }

    public function list(rc) {

        /*if (!structKeyExists(session, "isLoggedIn")) {
            rc.errors = "You are not logged in";
            variables.fw.redirect("main.default", "errors");
        }*/
        if(structKeyExists(rc, "start") && (!isNumeric(rc.start) ||
                            rc.start <= 0 || round(rc.start) != rc.start)) {

            rc.start = true;
        }
    }


    function post(rc) {
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

        rc.data = questionService.post(rc.title, rc.text,
                                       session.auth.userid);
        //Right now we assume the post just worked
        rc.questionid = rc.data.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function postAnswer(rc) {
        loadQuestion(rc);

        rc.answer = trim(htmlEditFormat(rc.answer));

        //Right now we assume the post just worked
        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function selectAnswer(rc) {
        loadQuestion(rc);

        if(!structKeyExists(rc, "user") || rc.user.getId() != rc.question.getUser().getID()) variables.fw.redirect("main.default");

        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function view(rc) {
        loadQuestion(rc);
    }

    function voteAnswerDown(rc) {
        loadQuestion(rc);

        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

    function voteAnswerUp(rc) {
        loadQuestion(rc);

        rc.questionid = rc.question.getId();
        variables.fw.redirect("question.view","none","questionid");
    }

}
