@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumed Vacation Days'
define view entity zi_krm_consumedvacationdays as select from zkrm_vacrequest
{   
    applicant as employee,
     sum(
        case when end_date > $session.user_date and start_date < $session.user_date
          then
           dats_days_between(start_date, $session.user_date) /* TODO: Keine Ahnung, wie man hier noch den Kalendar beachtet */
          when end_date < $session.user_date and start_date < $session.user_date
          then
            vacation_days
           else 0
        end)       
 as ConsumedVacationDays
}
where status = 'A'
group by
applicant;
