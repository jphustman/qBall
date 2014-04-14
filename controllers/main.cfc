<<<<<<< HEAD
component accessors="true" {

    property questionService;

    function init(fw) {
        variables.fw = fw;
    }

    function default(rc) {
        rc.questions = questionService.list(perpage=5);
    }

}
=======
component accessors="true" {

    property questionService;

    function init(fw) {
        variables.fw = fw;
    }

    function default(rc) {
        rc.questions = questionService.list(perpage=5);
    }

}
>>>>>>> f761099fe0ebb71971568effb98210adf597376f
