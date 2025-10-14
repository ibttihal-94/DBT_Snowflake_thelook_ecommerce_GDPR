{% macro norm_user_id(col) -%}
  NULLIF(
    TRIM(
      COALESCE(
        TO_VARCHAR(TRY_TO_NUMBER(TO_VARCHAR({{ col }}))),
        TO_VARCHAR({{ col }})
      )
    ),
    ''
  )
{%- endmacro %}