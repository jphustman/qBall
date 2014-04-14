<<<<<<< HEAD
component extends="wirebox.system.ioc.Injector" {

    // the FW/1 requirements for a bean factory are very simple:

    public boolean function containsBean( string beanName ) {
        return super.containsInstance( beanName );
    }

    public any function getBean( string beanName ) {
        return super.getInstance( beanName );
    }

}
=======
component extends="wirebox.system.ioc.Injector" {

    // the FW/1 requirements for a bean factory are very simple:

    public boolean function containsBean( string beanName ) {
        return super.containsInstance( beanName );
    }

    public any function getBean( string beanName ) {
        return super.getInstance( beanName );
    }

}
>>>>>>> f761099fe0ebb71971568effb98210adf597376f
