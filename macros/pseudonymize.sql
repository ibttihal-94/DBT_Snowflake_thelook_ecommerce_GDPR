{% macro pseudonymize_user(col) -%}
  CASE
    WHEN {{ norm_user_id(col) }} IS NULL THEN NULL
    ELSE MD5(CONCAT({{ norm_user_id(col) }}, '{{ var("pii_salt") }}'))
  END
{%- endmacro %}