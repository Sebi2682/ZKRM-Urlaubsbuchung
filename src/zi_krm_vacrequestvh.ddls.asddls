
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Request Value Help'

define view entity ZI_KRM_VACREQUESTVH
  as select from zkrm_vacrequest
{
  key id              as Id,
      applicant       as Applicant,
      approver        as Approver,
      start_date      as StartDate,
      end_date        as EndDate,
      status          as Status,
      request_comment as RequestComment

      /*
      created_by as CreatedBy,
      created_at as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt
      */
}
