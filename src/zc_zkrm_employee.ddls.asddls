@EndUserText.label: 'Employee View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_ZKRM_EMPLOYEE as projection on ZR_ZKRM_EMPLOYEE_VIEW
{
  key Id,
  EmployeeNumber,
   @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
  FirstName,
  @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
  Surname,
   @Search.defaultSearchElement: true
  EntryDate,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt
}
