@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee base view'
define root view entity ZR_KRM_EMPLOYEEVIEW as select from zkrm_employee
composition [0..*] of ZR_KRM_HOLIENTITLE as _HOLIENTITLES
composition [0..*] of zr_krm_vacrequest as _VACREQUESTS
association [1..1] to ZI_KRM_AVAILABLEVACATIONDAYS as _availablevd on $projection.Id = _availablevd.Employee
association [1..1] to ZI_krm_plannedvacationdays as _plannedvd on $projection.Id = _plannedvd.employee
association [1..1] to zi_krm_consumedvacationdays as _consumedvd on $projection.Id = _consumedvd.employee


{
    key id as Id,
    employee_number as EmployeeNumber,
    first_name as FirstName,
    surname as Surname,
    entry_date as EntryDate,
    
    /* Administrative Data */
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    
    /* Transient Data */
    _consumedvd.ConsumedVacationDays as ConsumedVacationDays,
    _plannedvd.PlannedVacationDays as PlannedVacationDays,
    _availablevd.AvailableVacationDays as AvailableVacationDays,
 
 
    /* Associations */   
    
    _HOLIENTITLES,
    _VACREQUESTS
      
}
