/*
 *  Copyright (c) Business Thinking Ltd. 2022
 *  This software includes code developed by the dbtvault Team at Business Thinking Ltd. Trading as Datavault
 */

{%- macro bigquery__xts(src_pk, src_satellite, src_extra_columns, src_ldts, src_source, source_model) -%}

{{ dbtvault.default__xts(src_pk=src_pk,
                         src_satellite=src_satellite,
                         src_extra_columns=src_extra_columns,
                         src_ldts=src_ldts,
                         src_source=src_source,
                         source_model=source_model) }}

{%- endmacro -%}
