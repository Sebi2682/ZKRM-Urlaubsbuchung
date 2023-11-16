@EndUserText.label: 'Employee Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_KRM_EMPLOYEE as projection on ZR_KRM_EMPLOYEEVIEW

{
    key Id,
    EmployeeNumber,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    FirstName,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    Surname,
    EntryDate,
    
//  Administrative Data
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt
}
