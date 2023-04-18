using EmpService from './org';

annotate EmpService.Employees with {
	name       @title: 'Name';
	level        @title: 'Level';
	level_name       @title: 'Level (Name)';
	mgr        @title: 'Manager';
	skills      @title: 'Skills';
}

annotate EmpService.Managers with {
	name  @title: 'Name';
    practice  @title : 'Practice';
    role @title : 'Role';
}

annotate EmpService.Employees with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Employee',
			TypeNamePlural: 'Employees',
			Title          : {
                $Type : 'UI.DataField',
                Value : name
            },
			Description : {
				$Type: 'UI.DataField',
				Value: level_name
			}
		},
		SelectionFields: [level],
		LineItem: [
			{Value: level},
			{Value: level_name},
			{Value: skills},
			{Value: email}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
				{Value: mgr_ID},
				{Value: skills},
				{Value: level}
			]
		}
	},
) {

};

annotate EmpService.Employees with {
	mgr @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: mgr.name  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Managers',
				CollectionPath: 'Managers',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: mgr_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'name'
					}
				]
			}
		}
	);
}
