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
    DATA employee TYPE zkrm_employee.
    DELETE FROM zkrm_employee.


    employee-client = sy-mandt.
    employee-created_by = 'GENERATOR'.
    employee-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD employee-created_at.
    GET TIME STAMP FIELD employee-last_changed_at.

    employee-id = '1'.
    employee-employee_number = '1'.
    employee-first_name = 'Hans'.
    employee-surname = 'Maier'.
    employee-entry_date = '20000501'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND employee TO employees .

    GET TIME STAMP FIELD employee-created_at.
    GET TIME STAMP FIELD employee-last_changed_at.

    employee-id = '2'.
    employee-employee_number = '2'.
    employee-first_name = 'Lisa'.
    employee-surname = 'Müller'.
    employee-entry_date = '20100701'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND employee TO employees .

    GET TIME STAMP FIELD employee-created_at.
    GET TIME STAMP FIELD employee-last_changed_at.

    employee-id = '3'.
    employee-employee_number = '3'.
    employee-first_name = 'Petra'.
    employee-surname = 'Schmid'.
    employee-entry_date = '20221001'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND employee TO employees .
    INSERT ZKRM_employee FROM TABLE @employees.




    DATA HolidayEntitlements TYPE TABLE OF zkrm_holientitle.
    DATA HolidayEntitlement TYPE zkrm_holientitle.
    DELETE FROM zkrm_holientitle.




    HolidayEntitlement-client = sy-mandt.
    HolidayEntitlement-created_by = 'GENERATOR'.
    HolidayEntitlement-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD HolidayEntitlement-created_at.
    GET TIME STAMP FIELD HolidayEntitlement-last_changed_at.

    HolidayEntitlement-id = '1'.
    HolidayEntitlement-employee = '1'.
    HolidayEntitlement-entitlement_year = '2022'.
    HolidayEntitlement-vacation_days = '30'.
    HolidayEntitlement-holidayentitlement_uuid   = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND HolidayEntitlement TO Holidayentitlements.

    GET TIME STAMP FIELD HolidayEntitlement-created_at.
    GET TIME STAMP FIELD HolidayEntitlement-last_changed_at.

    HolidayEntitlement-id = '2'.
    HolidayEntitlement-employee = '1'.
    HolidayEntitlement-entitlement_year = '2023'.
    HolidayEntitlement-vacation_days = '30'.
    HolidayEntitlement-holidayentitlement_uuid   = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND HolidayEntitlement TO Holidayentitlements.


    GET TIME STAMP FIELD HolidayEntitlement-created_at.
    GET TIME STAMP FIELD HolidayEntitlement-last_changed_at.

    HolidayEntitlement-id = '3'.
    HolidayEntitlement-employee = '2'.
    HolidayEntitlement-entitlement_year = '2023'.
    HolidayEntitlement-vacation_days = '30'.
    HolidayEntitlement-holidayentitlement_uuid   = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND HolidayEntitlement TO Holidayentitlements.

    GET TIME STAMP FIELD HolidayEntitlement-created_at.
    GET TIME STAMP FIELD HolidayEntitlement-last_changed_at.

    HolidayEntitlement-id = '4'.
    HolidayEntitlement-employee = '3'.
    HolidayEntitlement-entitlement_year = '2023'.
    HolidayEntitlement-vacation_days = '7'.
    HolidayEntitlement-holidayentitlement_uuid   = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND HolidayEntitlement TO Holidayentitlements.




    DATA VacationRequests TYPE TABLE OF zkrm_vacrequest.
    DATA VacationRequest TYPE zkrm_vacrequest.
    DELETE FROM zkrm_vacrequest.



    VacationRequest-client = sy-mandt.
    VacationRequest-created_by = 'GENERATOR'.
    VacationRequest-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.

    VacationRequest-id = '1'.
    VacationRequest-applicant = '10000000000000000000000000000000'.
    VacationRequest-approver = '20000000000000000000000000000000'.
    VacationRequest-start_date = '20220701'.
    VacationRequest-end_date = '20220710'.
    VacationRequest-status = 'G'.
    VacationRequest-request_comment = 'Sommerurlaub'.
    VacationRequest-vacrequest_uuid = cl_system_uuid=>create_uuid_x16_static( ).


    APPEND VacationRequest TO VacationRequests .


    VacationRequest-client = sy-mandt.
    VacationRequest-created_by = 'GENERATOR'.
    VacationRequest-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.

    VacationRequest-id = '2'.
    VacationRequest-applicant = '10000000000000000000000000000000'.
    VacationRequest-approver = '20000000000000000000000000000000'.
    VacationRequest-start_date = '20221227'.
    VacationRequest-end_date = '20221230'.
    VacationRequest-status = 'A'.
    VacationRequest-request_comment = 'Weihnachtsurlaub'.
    VacationRequest-vacrequest_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND VacationRequest TO VacationRequests .


    VacationRequest-client = sy-mandt.
    VacationRequest-created_by = 'GENERATOR'.
    VacationRequest-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.

    VacationRequest-id = '3'.
    VacationRequest-applicant = '10000000000000000000000000000000'.
    VacationRequest-approver = '20000000000000000000000000000000'.
    VacationRequest-start_date = '20221228'.
    VacationRequest-end_date = '20221230'.
    VacationRequest-status = 'G'.
    VacationRequest-request_comment = 'Weihnachtsurlaub (2. Versuch)'.
    VacationRequest-vacrequest_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND VacationRequest TO VacationRequests .


    VacationRequest-client = sy-mandt.
    VacationRequest-created_by = 'GENERATOR'.
    VacationRequest-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.

    VacationRequest-id = '4'.
    VacationRequest-applicant = '10000000000000000000000000000000'.
    VacationRequest-approver = '20000000000000000000000000000000'.
    VacationRequest-start_date = '20230527'.
    VacationRequest-end_date = '20230614'.
    VacationRequest-status = 'G'.
    VacationRequest-request_comment = ''.
    VacationRequest-vacrequest_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND VacationRequest TO VacationRequests .


    VacationRequest-client = sy-mandt.
    VacationRequest-created_by = 'GENERATOR'.
    VacationRequest-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.

    VacationRequest-id = '5'.
    VacationRequest-applicant = '10000000000000000000000000000000'.
    VacationRequest-approver = '20000000000000000000000000000000'.
    VacationRequest-start_date = '20231220'.
    VacationRequest-end_date = '20231231'.
    VacationRequest-status = 'B'.
    VacationRequest-request_comment = 'Winterurlaub'.
    VacationRequest-vacrequest_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND VacationRequest TO VacationRequests .


    VacationRequest-client = sy-mandt.
    VacationRequest-created_by = 'GENERATOR'.
    VacationRequest-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD VacationRequest-created_at.
    GET TIME STAMP FIELD VacationRequest-last_changed_at.

    VacationRequest-id = '6'.
    VacationRequest-applicant = '30000000000000000000000000000000'.
    VacationRequest-approver = '10000000000000000000000000000000'.
    VacationRequest-start_date = '20231227'.
    VacationRequest-end_date = '20231231'.
    VacationRequest-status = 'B'.
    VacationRequest-request_comment = 'Weihnachtsurlaub'.
    VacationRequest-vacrequest_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND VacationRequest TO VacationRequests .


    INSERT zkrm_vacrequest FROM TABLE @VacationRequests .


          endmethod.
ENDCLASS.
