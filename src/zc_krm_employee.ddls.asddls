@EndUserText.label: 'Employee Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_KRM_EMPLOYEE
  provider contract transactional_query
  as projection on ZR_KRM_EMPLOYEEVIEW
{
      @UI.hidden: true
      key Id,
     @Consumption.valueHelpDefinition: [{ entity: {name : 'ZI_KRM_EMPLOYEENUMBERVH', element: 'EmployeeNumber'}}]
      EmployeeNumber,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
     
     
      FirstName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    
      Surname,
      EntryDate,

      // Administrative Data
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
//    Transient Data
      ConsumedVacationDays,
      PlannedVacationDays,
      AvailableVacationDays,

      /*Associations*/
      _HOLIENTITLES : redirected to composition child ZC_KRM_HOLIENTITLE,
      _VACREQUESTS  : redirected to composition child ZC_KRM_VACREQUEST

}
