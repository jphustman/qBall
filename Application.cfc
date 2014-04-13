component extends="framework.one" {

    this.name = "qball";
    this.sessionManagement = true;
    this.dataSource = this.name;
    this.ormEnabled = true;
    this.ormsettings = {
        cfclocation="./model/beans",
        /*dbcreate="dropcreate",*/
        dbcreate="update",
        dialect="MySQL",
        eventhandling="true",
        eventhandler="model.beans.eventHandler",
        logsql="true"
    };


    variables.framework = {
        reloadApplicationOnEveryRequest=true,
        trace=true
    };

    public function setupApplication() {
        var bf = new framework.ioc("./model");
        setBeanFactory(bf);
    }

    public function setupRequest() {
        if(structKeyExists(url, "init")) {
            setupApplication();
            ormReload();
            location(url="index.cfm",addToken=false);
        }

        controller("user.checkAuthorizaion");

    }

}
