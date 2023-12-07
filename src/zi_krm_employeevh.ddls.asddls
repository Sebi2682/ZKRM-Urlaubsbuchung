@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Value Help'


define view entity ZI_KRM_EMPLOYEEVH
  as select from zkrm_employee

{
  key id              as Id,
      employee_number as EmployeeNumber,
      first_name      as FirstName,
      surname         as Surname

      /*
      entry_date      as EntryDate,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt
      */
      
}
