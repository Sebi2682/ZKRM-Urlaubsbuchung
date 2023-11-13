@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Base View'
define root view entity ZR_ZKRM_EMPLOYEEVIEW as select from zkrm_employee
//composition of target_data_source_name as _association_name
{
  key id as Id,
  key employee_uuid as EmployeeUuid,
  employee_number as EmployeeNumber,
  first_name as FirstName,
  surname as Surname,
  entry_date as EntryDate,
  created_by as CreatedBy,
  created_at as CreatedAt,
  last_changed_by as LastChangedBy,
  last_changed_at as LastChangedAt
 // _association_name // Make association public
}
