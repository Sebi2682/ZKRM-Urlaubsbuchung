@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Request Base View'
define view entity zr_krm_vacrequest as select from zkrm_vacrequest
association to parent ZR_KRM_EMPLOYEEVIEW as _employeeview
    on $projection.Applicant = _employeeview.Id
//    AND  $projection.approver = _employeeview.id
{
    key id as Id,
    applicant as Applicant,
    approver as Approver,
    start_date as StartDate,
    end_date as EndDate,
    status as Status,
    request_comment as RequestComment,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    _employeeview // Make association public
}
