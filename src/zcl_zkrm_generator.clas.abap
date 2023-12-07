CLASS zcl_zkrm_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ZKRM_GENERATOR IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA employees TYPE TABLE OF zkrm_employee.
    DATA employee  TYPE zkrm_employee.
    DELETE FROM zkrm_employee.

    DATA HolidayEntitlements TYPE TABLE OF zkrm_holientitle.
    DATA HolidayEntitlement  TYPE zkrm_holientitle.
    DELETE FROM zkrm_holientitle.

    DATA VacationRequests TYPE TABLE OF zkrm_vacrequest.
    DATA VacationRequest  TYPE zkrm_vacrequest.
    DELETE FROM zkrm_vacrequest.

    DATA(Hans_id) = cl_system_uuid=>create_uuid_x16_static( ).
    DATA(Lisa_id) = cl_system_uuid=>create_uuid_x16_static( ).
    DATA(Petra_id) = cl_system_uuid=>create_uuid_x16_static( ).


    employee-client          = sy-mandt.
    employee-created_by      = 'GENERATOR'.
    employee-last_changed_by = 'GENERATOR'.

    HolidayEntitlement-client          = sy-mandt.
    HolidayEntitlement-created_by      = 'GENERATOR'.
    HolidayEntitlement-last_changed_by = 'GENERATOR'.

    VacationRequest-client          = sy-mandt.
    VacationRequest-created_by      = 'GENERATOR'.
    VacationRequest-last_changed_by = 'GENERATOR'.

    " ------ Hans Mayer anlegen und Urlaubsanspruch + Urlaubsantrag hinzufügen ------

    GET TIME STAMP FIELD employee-created_at.
    GET TIME STAMP FIELD employee-last_changed_at.
    employee-id              = Hans_id.
    employee-employee_number = '1'.
    employee-first_name      = 'Hans'.
    employee-surname         = 'Maier'.
    employee-entry_date      = '20000501'.

    APPEND employee TO employees.

    GET TIME STAMP FIELD HolidayEntitlement-created_at.
    GET TIME STAMP FIELD HolidayEntitlement-last_changed_at.
    HolidayEntitlement-id               = cl_system_uuid=>create_uuid_x16_static( ).
    HolidayEntitlement-employee         = hans_id.
    HolidayEntitlement-entitlement_year = '2022'.
    HolidayEntitlement-vacation_days    = '30'.

    APPEND HolidayEntitlement TO Holidayentitlements.

    GET TIME STAMP FIELD HolidayEntitlement-created_at.
    GET TIME STAMP FIELD HolidayEntitlement-last_changed_at.
    HolidayEntitlement-id               = cl_system_uuid=>create_uuid_x16_static( ).
    HolidayEntitlement-employee         = Hans_id.
    HolidayEntitlement-entitlement_year = '2023'.
    HolidayEntitlement-vacation_days    = '30'.

    APPEND HolidayEntitlement TO Holidayentitlements.

    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.
    VacationRequest-id              = cl_system_uuid=>create_uuid_x16_static( ).
    VacationRequest-applicant       = Hans_id.
    VacationRequest-approver        = Lisa_id.
    VacationRequest-start_date      = '20220701'.
    VacationRequest-end_date        = '20220710'.
    VacationRequest-vacation_days   = 6.
    VacationRequest-status          = 'A'.
    VacationRequest-request_comment = 'Sommerurlaub'.

    APPEND VacationRequest TO VacationRequests.

    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.
    VacationRequest-id              = cl_system_uuid=>create_uuid_x16_static( ).
    VacationRequest-applicant       = Hans_id.
    VacationRequest-approver        = Lisa_id.
    VacationRequest-start_date      = '20221227'.
    VacationRequest-end_date        = '20221230'.
    VacationRequest-vacation_days   = 4.
    VacationRequest-status          = 'D'.
    VacationRequest-request_comment = 'Weihnachtsurlaub'.

    APPEND VacationRequest TO VacationRequests.

    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.
    VacationRequest-id              = cl_system_uuid=>create_uuid_x16_static( ).
    VacationRequest-applicant       = Hans_id.
    VacationRequest-approver        = Lisa_id.
    VacationRequest-start_date      = '20221228'.
    VacationRequest-end_date        = '20221230'.
    VacationRequest-vacation_days   = 3.
    VacationRequest-status          = 'A'.
    VacationRequest-request_comment = 'Weihnachtsurlaub (2. Versuch)'.

    APPEND VacationRequest TO VacationRequests.

    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.
    VacationRequest-id              = cl_system_uuid=>create_uuid_x16_static( ).
    VacationRequest-applicant       = Hans_id.
    VacationRequest-approver        = Lisa_id.
    VacationRequest-start_date      = '20230527'.
    VacationRequest-end_date        = '20230614'.
    VacationRequest-vacation_days   = 11.
    VacationRequest-status          = 'A'.
    VacationRequest-request_comment = ''.

    APPEND VacationRequest TO VacationRequests.

    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.
    VacationRequest-id              = cl_system_uuid=>create_uuid_x16_static( ).
    VacationRequest-applicant       = Hans_Id.
    VacationRequest-approver        = Lisa_Id.
    VacationRequest-start_date      = '20231220'.
    VacationRequest-end_date        = '20231231'.
    VacationRequest-vacation_days   = 6.
    VacationRequest-status          = 'R'.
    VacationRequest-request_comment = 'Winterurlaub'.

    APPEND VacationRequest TO VacationRequests.

    " ------ Lisa Müller anlegen und Urlaubsanspruch + Urlaubsantrag hinzufügen ------

    GET TIME STAMP FIELD employee-created_at.
    GET TIME STAMP FIELD employee-last_changed_at.
    employee-id              = Lisa_id.
    employee-employee_number = '2'.
    employee-first_name      = 'Lisa'.
    employee-surname         = 'Müller'.
    employee-entry_date      = '20100701'.

    APPEND employee TO employees.

    GET TIME STAMP FIELD HolidayEntitlement-created_at.
    GET TIME STAMP FIELD HolidayEntitlement-last_changed_at.
    HolidayEntitlement-id               = cl_system_uuid=>create_uuid_x16_static( ).
    HolidayEntitlement-employee         = Lisa_id.
    HolidayEntitlement-entitlement_year = '2023'.
    HolidayEntitlement-vacation_days    = '30'.

    APPEND HolidayEntitlement TO Holidayentitlements.

    " ------ Petra Schmidt anlegen und Urlaubsanspruch + Urlaubsantrag hinzufügen ------

    GET TIME STAMP FIELD employee-created_at.
    GET TIME STAMP FIELD employee-last_changed_at.
    employee-id              = petra_id.
    employee-employee_number = '3'.
    employee-first_name      = 'Petra'.
    employee-surname         = 'Schmid'.
    employee-entry_date      = '20221001'.

    APPEND employee TO employees.

    GET TIME STAMP FIELD HolidayEntitlement-created_at.
    GET TIME STAMP FIELD HolidayEntitlement-last_changed_at.
    HolidayEntitlement-id               = cl_system_uuid=>create_uuid_x16_static( ).
    HolidayEntitlement-employee         = petra_id.
    HolidayEntitlement-entitlement_year = '2023'.
    HolidayEntitlement-vacation_days    = '7'.

    APPEND HolidayEntitlement TO Holidayentitlements.

    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.
    VacationRequest-id              = cl_system_uuid=>create_uuid_x16_static( ).
    VacationRequest-applicant       = petra_id.
    VacationRequest-approver        = hans_id.
    VacationRequest-start_date      = '20231227'.
    VacationRequest-end_date        = '20231231'.
    VacationRequest-vacation_days   = 3.
    VacationRequest-status          = 'R'.
    VacationRequest-request_comment = 'Weihnachtsurlaub'.

    APPEND VacationRequest TO VacationRequests.

    INSERT ZKRM_employee FROM TABLE @employees.
    INSERT zkrm_vacrequest FROM TABLE @VacationRequests.
    INSERT zkrm_holientitle from table @holidayentitlements.

    out->write( |Inserted Employees: { sy-dbcnt }| ).

  ENDMETHOD.
ENDCLASS.
