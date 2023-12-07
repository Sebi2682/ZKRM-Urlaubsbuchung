@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Holiday Entitlement Value Help'


define view entity ZI_KRM_HOLIENTITLEVH
  as select from zkrm_holientitle
{
  key id               as Id,
      employee         as Employee,
      entitlement_year as EntitlementYear,
      vacation_days    as VacationDays
      
     /* created_by       as CreatedBy,
      created_at       as CreatedAt,
      last_changed_by  as LastChangedBy,
      last_changed_at  as LastChangedAt
      */
}
