data "oci_data_safe_masking_policies_masking_columns" "data_safe_masking_policies_masking_columns_lookup" {
  for_each = var.data_safe_masking_policies_masking_columns_lookup

  masking_policy_id                     = each.value.masking_policy_id
  column_name                           = each.value.column_name
  data_type                             = each.value.data_type
  is_masking_enabled                    = each.value.is_masking_enabled
  is_seed_required                      = each.value.is_seed_required
  masking_column_group                  = each.value.masking_column_group
  masking_column_lifecycle_state        = each.value.masking_column_lifecycle_state
  object                                = each.value.object
  object_type                           = each.value.object_type
  schema_name                           = each.value.schema_name
  sensitive_type_id                     = each.value.sensitive_type_id
  time_created_greater_than_or_equal_to = each.value.time_created_greater_than_or_equal_to
  time_created_less_than                = each.value.time_created_less_than
  time_updated_greater_than_or_equal_to = each.value.time_updated_greater_than_or_equal_to
  time_updated_less_than                = each.value.time_updated_less_than

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

