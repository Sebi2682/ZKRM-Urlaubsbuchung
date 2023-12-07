@EndUserText.label: 'Holiday Entitlement Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_KRM_HOLIENTITLE as projection on ZR_KRM_HOLIENTITLE
{
  @UI.hidden: true
  key Id, 
 @UI.hidden: true
  Employee,
 // @Consumption.valueHelpDefinition: [{ entity: {name : 'ZI_KRM_HOLIENTITLEVH', element: 'EntitlementYear'}}]
  EntitlementYear,
 // @Consumption.valueHelpDefinition: [{ entity: {name : 'ZI_KRM_HOLIENTITLEVH', element: 'VacationDays'}}]
  VacationDays,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  
  /* Transient Data */
  EmployeeText,  
  
  /* Associations */
  _Employeeview : redirected to parent ZC_KRM_EMPLOYEE
}
