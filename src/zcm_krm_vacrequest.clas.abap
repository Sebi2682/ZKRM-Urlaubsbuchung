CLASS zcm_krm_vacrequest DEFINITION public
  INHERITING FROM cx_static_check FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    " Interfaces
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    " Message Constants

    CONSTANTS:
      BEGIN OF vacrequest_endbeforestart,
        msgid TYPE symsgid      VALUE 'Z_KRM_VACREQUEST',
        msgno TYPE symsgno      VALUE '005',
        attr1 TYPE scx_attrname VALUE 'EndDate',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF vacrequest_endbeforestart.

    CONSTANTS:
      BEGIN OF vacrequest_novacationleft,
        msgid TYPE symsgid      VALUE 'Z_KRM_VACREQUEST',
        msgno TYPE symsgno      VALUE '006',
        attr1 TYPE scx_attrname VALUE 'vacation_days',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF vacrequest_novacationleft.

    CONSTANTS:
      BEGIN OF vacrequest_startdatepast,
        msgid TYPE symsgid      VALUE 'Z_KRM_VACREQUEST',
        msgno TYPE symsgno      VALUE '007',
        attr1 TYPE scx_attrname VALUE 'vacation_days',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF vacrequest_startdatepast.

    " Attributs
    DATA vacation_days TYPE Z_krm_vacation_days.
    DATA EndDate       TYPE z_krm_end_date.

    " Constructor
    METHODS constructor
      IMPORTING severity      TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
                textid        LIKE if_t100_message=>t100key         DEFAULT if_t100_message=>default_textid
                !previous     LIKE previous                         OPTIONAL
                vacation_days TYPE Z_krm_vacation_days              OPTIONAL
                EndDate       TYPE z_krm_end_date                   OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcm_krm_vacrequest IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    if_abap_behv_message~m_severity = severity.
    me->vacation_days = vacation_days.
    me->EndDate       = EndDate.
  ENDMETHOD.

ENDCLASS.
