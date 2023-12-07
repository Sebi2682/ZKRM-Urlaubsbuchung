@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Holiday Entitlement Base View'
define view entity ZR_KRM_HOLIENTITLE as select from zkrm_holientitle
association to parent ZR_KRM_EMPLOYEEVIEW as _Employeeview
    on $projection.Employee = _Employeeview.Id
association [1..1] to zi_krm_employeetext as _EmployeeText on $projection.Employee = _EmployeeText.Id

{
    key id as Id,
    employee as Employee,
    entitlement_year as EntitlementYear,
    vacation_days as VacationDays,
    
    /* Administrative Data */
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    
    /* Transient Data */
    
    _EmployeeText.Name as EmployeeText,
    
    // Make association public
    _Employeeview 
    
    
}
