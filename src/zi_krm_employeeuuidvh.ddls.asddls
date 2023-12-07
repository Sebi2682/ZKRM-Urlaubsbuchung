@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Uuid Value Help'
define view entity zi_krm_employeeuuidvh
  as select from zkrm_employee
{
      /* Fields */
      @UI.hidden: true
  key id                                        as EmployeeId,
  
      @EndUserText: { label: 'Employee Number', quickInfo: 'Employee Number' }
      employee_number as EmployeeNumber,
      
      @EndUserText: { label: 'First name', quickInfo: 'First Name' }
      first_name                                         as FirstName,
      
      @EndUserText: { label: 'Surname', quickInfo: 'Surname' }
      surname                                          as LastName
}
