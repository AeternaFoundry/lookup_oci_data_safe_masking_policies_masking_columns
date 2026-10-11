variable "data_safe_masking_policies_masking_columns_lookup" {
  description = <<EOT
Map of data_safe_masking_policies_masking_columns_lookup, attributes below
Required:
    - masking_policy_id
Optional:
    - column_name
    - data_type
    - is_masking_enabled
    - is_seed_required
    - masking_column_group
    - masking_column_lifecycle_state
    - object
    - object_type
    - schema_name
    - sensitive_type_id
    - time_created_greater_than_or_equal_to
    - time_created_less_than
    - time_updated_greater_than_or_equal_to
    - time_updated_less_than
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    masking_policy_id                     = string
    column_name                           = optional(list(string))
    data_type                             = optional(list(string))
    is_masking_enabled                    = optional(bool)
    is_seed_required                      = optional(bool)
    masking_column_group                  = optional(list(string))
    masking_column_lifecycle_state        = optional(string)
    object                                = optional(list(string))
    object_type                           = optional(list(string))
    schema_name                           = optional(list(string))
    sensitive_type_id                     = optional(string)
    time_created_greater_than_or_equal_to = optional(string)
    time_created_less_than                = optional(string)
    time_updated_greater_than_or_equal_to = optional(string)
    time_updated_less_than                = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_safe_masking_policies_masking_columns_lookup : (
        alltrue([for item in v.masking_column_collection : (item.items == null || alltrue([for item in item.items : (item.masking_formats == null || alltrue([for item in item.masking_formats : (item.format_entries == null || alltrue([for item in item.format_entries : (item.type == null || (contains([for v in ["DELETE_ROWS", "DETERMINISTIC_ENCRYPTION", "DETERMINISTIC_ENCRYPTION_DATE", "DETERMINISTIC_SUBSTITUTION", "FIXED_NUMBER", "FIXED_STRING", "LIBRARY_MASKING_FORMAT", "NULL_VALUE", "PATTERN", "POST_PROCESSING_FUNCTION", "PRESERVE_ORIGINAL_DATA", "RANDOM_DATE", "RANDOM_DECIMAL_NUMBER", "RANDOM_DIGITS", "RANDOM_LIST", "RANDOM_NUMBER", "RANDOM_STRING", "RANDOM_SUBSTITUTION", "REGULAR_EXPRESSION", "SHUFFLE", "SQL_EXPRESSION", "SUBSTRING", "TRUNCATE_TABLE", "USER_DEFINED_FUNCTION"] : lower(v)], lower(item.type))))]))]))]))])
      )
    ])
    error_message = "must be one of: \"DELETE_ROWS\", \"DETERMINISTIC_ENCRYPTION\", \"DETERMINISTIC_ENCRYPTION_DATE\", \"DETERMINISTIC_SUBSTITUTION\", \"FIXED_NUMBER\", \"FIXED_STRING\", \"LIBRARY_MASKING_FORMAT\", \"NULL_VALUE\", \"PATTERN\", \"POST_PROCESSING_FUNCTION\", \"PRESERVE_ORIGINAL_DATA\", \"RANDOM_DATE\", \"RANDOM_DECIMAL_NUMBER\", \"RANDOM_DIGITS\", \"RANDOM_LIST\", \"RANDOM_NUMBER\", \"RANDOM_STRING\", \"RANDOM_SUBSTITUTION\", \"REGULAR_EXPRESSION\", \"SHUFFLE\", \"SQL_EXPRESSION\", \"SUBSTRING\", \"TRUNCATE_TABLE\", \"USER_DEFINED_FUNCTION\""
  }
}

