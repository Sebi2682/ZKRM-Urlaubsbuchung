@EndUserText.label: 'Employee Projection View 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_KRM_EMPLOYEE_2 
  provider contract transactional_query
  as projection on ZR_KRM_EMPLOYEEVIEW
{
  key Id,
  EmployeeNumber,
  FirstName,
  Surname,
  EntryDate,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  ConsumedVacationDays,
  PlannedVacationDays,
  AvailableVacationDays,
  /* Associations */
  _VACREQUESTS  : redirected to composition child ZC_KRM_VACREQUEST_2
}
