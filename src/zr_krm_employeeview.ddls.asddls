@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee base view'
define root view entity ZR_KRM_EMPLOYEEVIEW as select from zkrm_employee
composition [0..*] of ZR_KRM_HOLIENTITLE as _holientitle
composition [0..*] of zr_krm_vacrequest as _vacrequest
{
     key id as Id,
    employee_number as EmployeeNumber,
    first_name as FirstName,
    surname as Surname,
    entry_date as EntryDate,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    _holientitle,
    _vacrequest
}
