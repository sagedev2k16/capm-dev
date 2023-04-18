sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.sd.org.org',
            componentId: 'EmployeesObjectPage',
            entitySet: 'Employees'
        },
        CustomPageDefinitions
    );
});