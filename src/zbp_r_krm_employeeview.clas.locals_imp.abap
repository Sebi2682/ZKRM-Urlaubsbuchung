CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Employee RESULT result.

ENDCLASS.

CLASS lhc_Employee IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_vacrequest DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR vacrequest RESULT result.

    METHODS ApproveVacationRequest FOR MODIFY
      IMPORTING keys FOR ACTION vacrequest~ApproveVacationRequest RESULT result.

    METHODS DeclineVacationRequest FOR MODIFY
      IMPORTING keys FOR ACTION vacrequest~DeclineVacationRequest RESULT result.

    METHODS DetermineStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR vacrequest~DetermineStatus.

    METHODS ValidateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR vacrequest~ValidateDates.

    METHODS ValidateVacDays FOR VALIDATE ON SAVE
      IMPORTING keys FOR vacrequest~ValidateVacDays.
    METHODS DetermineVacationDays FOR DETERMINE ON MODIFY
      IMPORTING keys FOR vacrequest~DetermineVacationDays.

ENDCLASS.

CLASS lhc_vacrequest IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD ApproveVacationRequest.
    DATA message TYPE REF TO zcm_krm_vacrequest.

    " Read Leave Request
    READ ENTITY IN LOCAL MODE zr_krm_vacrequest
         FIELDS ( Status RequestComment )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacrequests).

    " Process Leave Request
    LOOP AT vacrequests REFERENCE INTO DATA(vacrequest).

      " Validate State and Create Error Message
      IF vacrequest->Status = 'D'.
        message = NEW zcm_krm_vacrequest( textid   = zcm_krm_vacrequest=>vacrequest_already_declined
                                          severity = if_abap_behv_message=>severity-error
                                          comment  = vacrequest->Requestcomment ).
        APPEND VALUE #( %tky = vacrequest->%tky
                        %msg = message ) TO reported-vacrequest.
        APPEND VALUE #( %tky = vacrequest->%tky ) TO failed-vacrequest.
        DELETE vacrequests INDEX sy-tabix.
        CONTINUE.
      ENDIF.

      IF vacrequest->Status = 'A'.
        message = NEW zcm_krm_vacrequest( textid   = zcm_krm_vacrequest=>vacrequest_already_approved
                                          severity = if_abap_behv_message=>severity-error
                                          comment  = vacrequest->requestcomment ).
        APPEND VALUE #( %tky = vacrequest->%tky
                        %msg = message ) TO reported-vacrequest.
        APPEND VALUE #( %tky = vacrequest->%tky ) TO failed-vacrequest.
        DELETE vacrequests INDEX sy-tabix.
        CONTINUE.
      ENDIF.

      " Set State to A und Create Success Message
      vacrequest->Status = 'A'.
           message = NEW zcm_krm_vacrequest(
                textid = zcm_krm_vacrequest=>vacrequest_approved
               severity = if_abap_behv_message=>severity-success
              comment = vacrequest->requestcomment
         ).
       APPEND VALUE #( %tky = vacrequest->%tky %msg = message ) TO reported-vacrequest.
    ENDLOOP.

    " Modify Leave Request
    MODIFY ENTITY IN LOCAL MODE zr_krm_vacrequest
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR lr IN vacrequests
                         ( %tky = lr-%tky Status = lr-Status ) ).

    " Set Result
    result = VALUE #( FOR lr IN vacrequests
                      ( %tky = lr-%tky %param = lr ) ).
  ENDMETHOD.

  METHOD DeclineVacationRequest.
    DATA message TYPE REF TO zcm_krm_vacrequest.

    " Read Leave Request
    READ ENTITY IN LOCAL MODE zr_krm_vacrequest
        FIELDS ( Status RequestComment )
        WITH CORRESPONDING #( keys )
        RESULT DATA(vacrequests).

    " Process Leave Request
    LOOP AT vacrequests REFERENCE INTO DATA(vacrequest).

      " Validate State and Create Error Message
      IF vacrequest->Status = 'D'.
       message = NEW zcm_krm_vacrequest(
           textid = zcm_krm_vacrequest=>vacrequest_already_declined
            severity = if_abap_behv_message=>severity-error
            comment  = vacrequest->Requestcomment
        ).
        APPEND VALUE #( %tky = vacrequest->%tky %msg = message ) TO reported-vacrequest.
        APPEND VALUE #( %tky = vacrequest->%tky ) TO failed-vacrequest.
        DELETE vacrequests INDEX sy-tabix.
        CONTINUE.
      ENDIF.

      IF vacrequest->Status = 'A'.
        message = NEW zcm_krm_vacrequest(
            textid = zcm_krm_vacrequest=>vacrequest_already_approved
            severity = if_abap_behv_message=>severity-error
            comment  = vacrequest->Requestcomment
        ).
        APPEND VALUE #( %tky = vacrequest->%tky %msg = message ) TO reported-vacrequest.
        APPEND VALUE #( %tky = vacrequest->%tky ) TO failed-vacrequest.
        DELETE vacrequests INDEX sy-tabix.
        CONTINUE.
      ENDIF.

      " Set State to D und Create Success Message
      vacrequest->Status = 'D'.
        message = NEW zcm_krm_vacrequest(
           textid = zcm_krm_vacrequest=>vacrequest_decline
           severity = if_abap_behv_message=>severity-success
           comment = vacrequest->Requestcomment
        ).
      APPEND VALUE #( %tky = vacrequest->%tky %msg = message ) TO reported-vacrequest.
    ENDLOOP.

    " Modify Leave Request
    MODIFY ENTITY IN LOCAL MODE zr_krm_vacrequest
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR lr IN vacrequests ( %tky = lr-%tky Status = lr-Status ) ).

    " Set Result
    result = VALUE #( FOR lr IN vacrequests ( %tky = lr-%tky %param = lr ) ).
  ENDMETHOD.

  METHOD DetermineStatus.
      " Read Travels
    READ ENTITY IN LOCAL MODE zr_krm_vacrequest
         FIELDS ( Status )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacrequests).

    " Modify Travels
    MODIFY ENTITY IN LOCAL MODE zr_krm_vacrequest
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR vr IN vacrequests
                         ( %tky   = vr-%tky
                           Status = 'R' ) ).
  ENDMETHOD.

  METHOD ValidateDates.
      DATA message TYPE REF TO zcm_krm_vacrequest.
      DATA(lo_context_info) = NEW cl_abap_context_info( ).
      DATA(lv_current_date) = lo_context_info->get_system_date( ).

    " Read Travels
    READ ENTITY IN LOCAL MODE ZR_krm_vacrequest
         FIELDS ( startDate EndDate )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacrequests).

    " Process Travels
    LOOP AT vacrequests INTO DATA(vacrequest).
      " Validate Dates and Create Error Message
      IF vacrequest-EndDate < vacrequest-startDate.
        message = NEW zcm_krm_vacrequest( textid = zcm_krm_vacrequest=>vacrequest_endbeforestart
        severity = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky = vacrequest-%tky
                        %msg = message ) TO reported-vacrequest.
        APPEND VALUE #( %tky = vacrequest-%tky ) TO failed-vacrequest.
      ENDIF.

      IF vacrequest-startDate < lv_current_date.
                message = NEW zcm_krm_vacrequest( textid = zcm_krm_vacrequest=>vacrequest_startdatepast
                severity = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky = vacrequest-%tky
                        %msg = message ) TO reported-vacrequest.
        APPEND VALUE #( %tky = vacrequest-%tky ) TO failed-vacrequest.
      endif.
    ENDLOOP.

  ENDMETHOD.

  METHOD ValidateVacDays.
    DATA message TYPE REF TO zcm_krm_vacrequest.

    " Read Travels
    READ ENTITY IN LOCAL MODE ZR_krm_vacrequest
         FIELDS ( startDate EndDate Applicant )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacrequests).

    " Process Travels
    LOOP AT vacrequests INTO DATA(vacrequest).
      TRY.
          DATA(startdate) = vacrequest-startdate.
          startdate -= 1.
          DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
          DATA(working_days) = calendar->calc_workingdays_between_dates( iv_start = startdate
                                                                         iv_end   = vacrequest-EndDate ).
        CATCH cx_fhc_runtime.
      ENDTRY.

      SELECT FROM zr_krm_employeeview
           FIELDS  AvailableVacationDays
           WHERE id = @vacrequest-Applicant
           INTO @DATA(availablevacationdays).
      ENDSELECT.

      IF AvailableVacationDays < working_days.
        message = NEW zcm_krm_vacrequest( textid   = zcm_krm_vacrequest=>vacrequest_novacationleft
                                          severity = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky = vacrequest-%tky
                        %msg = message ) TO reported-vacrequest.
        APPEND VALUE #( %tky = vacrequest-%tky ) TO failed-vacrequest.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD DetermineVacationDays.
    " Read Travels
    READ ENTITY IN LOCAL MODE ZR_krm_vacrequest
         FIELDS ( startDate EndDate )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacrequests).

      Loop at vacrequests into data(vacrequest).

    DATA(startdate) = vacrequest-startdate.
    startdate = startdate - 1.
    try.
    DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
    DATA(working_days) = calendar->calc_workingdays_between_dates( iv_start = startdate iv_end = vacrequest-EndDate ).
    catch cx_fhc_runtime.
    endtry.

    MODIFY ENTITY IN LOCAL MODE zr_krm_vacrequest
           UPDATE FIELDS ( Vacationdays )
           WITH VALUE #( FOR vr IN vacrequests
                         ( %tky   = vr-%tky
                           vacationdays = working_days ) ).
     endloop.
  ENDMETHOD.

ENDCLASS.
