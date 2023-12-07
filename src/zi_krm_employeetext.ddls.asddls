@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Text'
define view entity zi_krm_employeetext as select from ZR_KRM_EMPLOYEEVIEW {

   @UI.hidden: true
  key Id                                 as Id,

      /* Transient Data */
      concat_with_space(FirstName, Surname, 1) as Name
}



