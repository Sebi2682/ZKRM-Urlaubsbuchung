@EndUserText.label: 'Employee Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_KRM_EMPLOYEE as projection on ZR_ZKRM_EMPLOYEEVIEW
{
  key Id,
  key EmployeeUuid,
  EmployeeNumber,
  FirstName,
  Surname,
  EntryDate,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt
}
