@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Holiday Entitlement Base View'
define view entity ZR_KRM_HOLIENTITLE as select from zkrm_holientitle
association to parent ZR_KRM_EMPLOYEEVIEW as _employeeview
    on $projection.Employee = _employeeview.Id
{
    key id as Id,
    employee as Employee,
    entitlement_year as EntitlementYear,
    vacation_days as VacationDays,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    _employeeview // Make association public
}
