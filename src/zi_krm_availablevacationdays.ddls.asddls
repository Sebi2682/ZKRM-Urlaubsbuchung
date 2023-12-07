@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Available Vacation Days'
define view entity ZI_KRM_AVAILABLEVACATIONDAYS 
as select from zkrm_holientitle
association [1..1] to ZI_krm_plannedvacationdays as _plannedvd on $projection.Employee = _plannedvd.employee
association [1..1] to zi_krm_consumedvacationdays as _consumedvd on $projection.Employee = _consumedvd.employee

{
  key employee as Employee,
  sum(vacation_days) - coalesce(_consumedvd.ConsumedVacationDays, 0) - coalesce(_plannedvd.PlannedVacationDays, 0) as AvailableVacationDays
}
//where
// entitlement_year = left($session.system_date, 4);
group by
employee, 
vacation_days,
_consumedvd.ConsumedVacationDays,
_plannedvd.PlannedVacationDays;
