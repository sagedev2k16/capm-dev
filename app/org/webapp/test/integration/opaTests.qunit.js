sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/sd/org/org/test/integration/FirstJourney',
		'com/sd/org/org/test/integration/pages/EmployeesList',
		'com/sd/org/org/test/integration/pages/EmployeesObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeesList, EmployeesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/sd/org/org') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEmployeesList: EmployeesList,
					onTheEmployeesObjectPage: EmployeesObjectPage
                }
            },
            opaJourney.run
        );
    }
);