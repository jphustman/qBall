component accessors="true" {

    property questionService;

    function init(fw) {
        variables.fw = fw;
    }

    function default(rc) {
        rc.questions = questionService.list(perpage=5);
    }

}
