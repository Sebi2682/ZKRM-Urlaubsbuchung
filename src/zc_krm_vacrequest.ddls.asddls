@EndUserText.label: 'Vacation Request Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_KRM_VACREQUEST as projection on zr_krm_vacrequest
{
  @UI.hidden: true
  key Id,
  Applicant,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'zi_krm_employeeuuidvh', element: 'EmployeeId' } }]
  Approver,
  StartDate,
  EndDate,
  vacationDays,
  @Consumption.valueHelpDefinition: [{ entity: {name : 'ZI_KRM_STATUSVH', element: 'Status'} }]
  Status,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.7
  RequestComment,   
  
  //Administrative Data
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  
  /* Transient Data */
  ApplicantName,
  ApproverName,
  StatusCriticality,
  
  /* Associations */
  _applicant : redirected to parent ZC_KRM_EMPLOYEE,
  _approver : redirected to ZC_KRM_EMPLOYEE
}
