@EndUserText.label: 'Vacation Request View 2'
@Search.searchable: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_KRM_VACREQUEST_2 as projection on zr_krm_vacrequest
{
  @UI.hidden: true
  key Id,
  @UI.hidden: true
  Applicant,
  @UI.hidden: true
  Approver,
  StartDate,
  EndDate,
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
  @Consumption.valueHelpDefinition: [{ entity: { name: 'zi_krm_employeetext', element: 'Name' } }]
  ApplicantName,
  ApproverName,
  StatusCriticality,
  
  /* Associations */
  _applicant : redirected to parent ZC_KRM_EMPLOYEE_2,
  _approver : redirected to ZC_KRM_EMPLOYEE_2
}
