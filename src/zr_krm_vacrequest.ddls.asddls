@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Request Base View'
define view entity zr_krm_vacrequest as select from zkrm_vacrequest
association to parent ZR_KRM_EMPLOYEEVIEW as _applicant
    on $projection.Applicant  = _applicant.Id
association [1..1] to ZR_KRM_EMPLOYEEVIEW       as _approver  on  $projection.Approver = _approver.Id
association [1..1] to zi_krm_employeetext as _EmployeeTextApplicant on $projection.Applicant = _EmployeeTextApplicant.Id
association [1..1] to zi_krm_employeetext as _EmployeeTextApprover on $projection.Approver = _EmployeeTextApprover.Id

{
    key id as Id,
    @Semantics.uuid: true
      @ObjectModel.text.element: ['ApplicantName']
    applicant as Applicant,
    @Semantics.uuid: true
    @ObjectModel.text.element: ['ApproverName']
    approver as Approver,
    start_date as StartDate,
    end_date as EndDate,
    status as Status,
    request_comment as RequestComment,
    vacation_days as vacationdays,
    
     /* Administrative Data */    
      @Semantics.user.createdBy: true
      created_by         as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at         as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by    as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at    as LastChangedAt,
    
    /* Transient Data */
    
    case status when 'A' then 3
                when 'R' then 2
                when 'D' then 1
                else 0
     end                as StatusCriticality,
    
    _EmployeeTextApplicant.Name as ApplicantName,
    _EmployeeTextApprover.Name as ApproverName,
    
          /* Associations */
    _applicant,
    _approver
       
}
