@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Number VH'
@Search.searchable: true
define view entity ZI_KRM_EmployeeNumberVH
  as select from zkrm_employee
{
      @UI.hidden: true
  key id              as Id,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      employee_number as EmployeeNumber,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      first_name      as FirstName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      surname         as Surname

}
