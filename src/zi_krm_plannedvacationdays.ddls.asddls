@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Planned Vacation Days'
define view entity ZI_krm_plannedvacationdays as select from zkrm_vacrequest
{
    
      applicant as employee,
sum( 
case when start_date > $session.system_date
then vacation_days
else 0
end) 
as PlannedVacationDays
}
where status <> 'D'
group by
applicant;
