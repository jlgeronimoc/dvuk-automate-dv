/*
 *  Copyright (c) Business Thinking Ltd. 2022
 *  This software includes code developed by the dbtvault Team at Business Thinking Ltd. Trading as Datavault
 */

{%- macro bigquery__t_link(src_pk, src_fk, src_payload, src_extra_columns, src_eff, src_ldts, src_source, source_model) -%}

{{ dbtvault.default__t_link(src_pk=src_pk, src_fk=src_fk, src_payload=src_payload,
                            src_extra_columns=src_extra_columns,
                            src_eff=src_eff, src_ldts=src_ldts, src_source=src_source,
                            source_model=source_model) }}

{%- endmacro -%}
