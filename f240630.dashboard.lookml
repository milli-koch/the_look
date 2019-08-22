- dashboard: f240630
  title: f240630
  layout: newspaper
  refresh: '900000000'
  elements:
  - title: Stalled Units and Logistics Performance - Overall
    name: Stalled Units and Logistics Performance - Overall
    model: f232393
    explore: order_items
    type: table
    fields: [users.city, users.city,
         users.city, users.city,
         users.city, users.city]
    pivots: [users.city, users.city]
    filters:
      users.city: "-CANCELLED,-REFUNDED,-RETURNED,-NULL"
      users.city: "-NULL,-CANCELLED, -RETURNED"
      users.city: 'Yes'
      order_items.id: ''
      users.city: ''
      users.city: '"JETBLACK_COURIER"'
    sorts: [colabo_public_oms_item_status_activity_history.progress desc, colabo_public_code_eight_purchase_order_item.sla_for_delivery_date_tiers,
      sort]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: total_queue_per_column, label: Total Queue
          per Column, expression: 'if(${colabo_public_oms_item_status_activity_history.progress}
          = "In Queue",${colabo_public_code_eight_purchase_order_item.total_units},null)',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: measure, _type_hint: number}, {table_calculation: sort, label: SORT,
        expression: "if(${colabo_public_oms_item_status_activity_history.status} =\
          \ \"PLACED\" , 1 ,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"SOURCED\" , 2 ,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"ORDERED\", 3,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"DISPATCHED\", 4,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"RECEIVED\", 5,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"INDUCTED\", 6,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"PACKED\", 7,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"QC_SIGNED_OFF\", 8,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"QC_APPROVED\", 8,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"SHIPPED\", 9,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"DELIVERED\", 10,10)))))))))))", value_format: !!null '', value_format_name: !!null '',
        is_disabled: false, _kind_hint: dimension, _type_hint: number}, {table_calculation: total_in_queue_units,
        label: Total In Queue Units, expression: 'sum(pivot_row(${total_queue_per_column}))',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: total_stalled_units,
        label: Total Stalled Units, expression: "${colabo_public_oms_item_status_activity_history_stalled_units.stalled_units:row_total}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_completed_units, label: Total
          Completed Units, expression: 'sum(pivot_row(${total_completed_per_column}))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_in_queue_time, label: Total
          In Queue Time, expression: 'coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},1),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},2),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},3),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},4),0)

          ', value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: total_completed_time,
        label: Total Completed Time, expression: 'coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},5),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},6),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},7),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},8),0)

          ', value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: aging_in_minutes,
        label: Aging (in Minutes), expression: "${total_in_queue_time}/ ${total_in_queue_units}",
        value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: turn_around_time_in_minutes,
        label: Turn Around Time (in Minutes), expression: "${total_completed_time}/${total_completed_units}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_completed_per_column, label: Total
          Completed per Column, expression: 'if(${colabo_public_oms_item_status_activity_history.progress}
          = "Completed",${colabo_public_code_eight_purchase_order_item.total_units},null)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: [colabo_public_oms_item_status_activity_history.total_time_difference,
      total_in_queue_time, total_completed_time, colabo_public_oms_item_status_activity_history_stalled_units.stalled_units,
      sort, total_queue_per_column, total_completed_per_column]
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 23
    height: 7
  - title: Stalled Units and Performance - Dispatch (Inbound)
    name: Stalled Units and Performance - Dispatch (Inbound)
    model: f232393
    explore: order_items
    type: table
    fields: [users.city, users.city,
      users.city, users.city,
      users.city, users.city]
    pivots: [users.city, users.city]
    filters:
      users.city: "-CANCELLED,-REFUNDED,-RETURNED,-NULL"
      users.city: "-NULL,-CANCELLED, -RETURNED"
      users.city: 'Yes'
      order_items.id: ''
      users.city: ''
      users.city: '"JETBLACK_COURIER"'
    sorts: [colabo_public_oms_item_status_activity_history.progress desc, colabo_public_code_eight_purchase_order_item.sla_for_delivery_date_tiers,
      sort]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: total_queue_per_column, label: Total Queue
          per Column, expression: 'if(${colabo_public_oms_item_status_activity_history.progress}
          = "In Queue",${colabo_public_code_eight_purchase_order_item.total_units},null)',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: measure, _type_hint: number}, {table_calculation: sort, label: SORT,
        expression: "if(${colabo_public_oms_item_status_activity_history.status} =\
          \ \"PLACED\" , 1 ,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"SOURCED\" , 2 ,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"ORDERED\", 3,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"DISPATCHED\", 4,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"RECEIVED\", 5,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"INDUCTED\", 6,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"PACKED\", 7,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"QC_SIGNED_OFF\", 8,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"QC_APPROVED\", 8,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"SHIPPED\", 9,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"DELIVERED\", 10,10)))))))))))", value_format: !!null '', value_format_name: !!null '',
        is_disabled: false, _kind_hint: dimension, _type_hint: number}, {table_calculation: total_in_queue_units,
        label: Total In Queue Units, expression: 'sum(pivot_row(${total_queue_per_column}))',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: total_stalled_units,
        label: Total Stalled Units, expression: "${colabo_public_oms_item_status_activity_history_stalled_units.stalled_units:row_total}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_completed_units, label: Total
          Completed Units, expression: 'sum(pivot_row(${total_completed_per_column}))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_in_queue_time, label: Total
          In Queue Time, expression: 'coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},1),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},2),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},3),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},4),0)

          ', value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: total_completed_time,
        label: Total Completed Time, expression: 'coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},5),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},6),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},7),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},8),0)

          ', value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: aging_in_minutes,
        label: Aging (in Minutes), expression: "${total_in_queue_time}/ ${total_in_queue_units}",
        value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: turn_around_time_in_minutes,
        label: Turn Around Time (in Minutes), expression: "${total_completed_time}/${total_completed_units}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_completed_per_column, label: Total
          Completed per Column, expression: 'if(${colabo_public_oms_item_status_activity_history.progress}
          = "Completed",${colabo_public_code_eight_purchase_order_item.total_units},null)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: [colabo_public_oms_item_status_activity_history.total_time_difference,
      total_in_queue_time, total_completed_time, colabo_public_oms_item_status_activity_history_stalled_units.stalled_units,
      sort, total_queue_per_column, total_completed_per_column]
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Filtered to only reflect sourcing method of Jetblack Courier
    listen: {}
    row: 7
    col: 0
    width: 23
    height: 8
  - title: Stalled Units and Performance - Fulfillment
    name: Stalled Units and Performance - Fulfillment
    model: f232393
    explore: order_items
    type: table
    fields: [users.city, users.city,
      users.city, users.city,
      users.city, users.city]
    pivots: [users.city, users.city]
    filters:
      users.city: "-CANCELLED,-REFUNDED,-RETURNED,-NULL"
      users.city: "-NULL,-CANCELLED, -RETURNED"
      users.city: 'Yes'
      order_items.id: ''
      users.city: ''
      users.city: "-DTC"
    sorts: [colabo_public_oms_item_status_activity_history.progress desc, colabo_public_code_eight_purchase_order_item.sla_for_delivery_date_tiers,
      sort]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: total_queue_per_column, label: Total Queue
          per Column, expression: 'if(${colabo_public_oms_item_status_activity_history.progress}
          = "In Queue",${colabo_public_code_eight_purchase_order_item.total_units},null)',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: measure, _type_hint: number}, {table_calculation: sort, label: SORT,
        expression: "if(${colabo_public_oms_item_status_activity_history.status} =\
          \ \"PLACED\" , 1 ,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"SOURCED\" , 2 ,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"ORDERED\", 3,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"DISPATCHED\", 4,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"RECEIVED\", 5,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"INDUCTED\", 6,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"PACKED\", 7,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"QC_SIGNED_OFF\", 8,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"QC_APPROVED\", 8,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"SHIPPED\", 9,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"DELIVERED\", 10,10)))))))))))", value_format: !!null '', value_format_name: !!null '',
        is_disabled: false, _kind_hint: dimension, _type_hint: number}, {table_calculation: total_in_queue_units,
        label: Total In Queue Units, expression: 'sum(pivot_row(${total_queue_per_column}))',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: total_stalled_units,
        label: Total Stalled Units, expression: "${colabo_public_oms_item_status_activity_history_stalled_units.stalled_units:row_total}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_completed_units, label: Total
          Completed Units, expression: 'sum(pivot_row(${total_completed_per_column}))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_in_queue_time, label: Total
          In Queue Time, expression: 'coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},1),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},2),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},3),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},4),0)

          ', value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: total_completed_time,
        label: Total Completed Time, expression: 'coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},5),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},6),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},7),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},8),0)

          ', value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: aging_in_minutes,
        label: Aging (in Minutes), expression: "${total_in_queue_time}/ ${total_in_queue_units}",
        value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: turn_around_time_in_minutes,
        label: Turn Around Time (in Minutes), expression: "${total_completed_time}/${total_completed_units}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_completed_per_column, label: Total
          Completed per Column, expression: 'if(${colabo_public_oms_item_status_activity_history.progress}
          = "Completed",${colabo_public_code_eight_purchase_order_item.total_units},null)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: [colabo_public_oms_item_status_activity_history.total_time_difference,
      total_in_queue_time, total_completed_time, colabo_public_oms_item_status_activity_history_stalled_units.stalled_units,
      sort, total_queue_per_column, total_completed_per_column]
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Filtered to exclude any DTC units
    listen: {}
    row: 23
    col: 0
    width: 23
    height: 8
  - title: Stalled Units and Performance - Dispatch (Outbound)
    name: Stalled Units and Performance - Dispatch (Outbound)
    model: f232393
    explore: order_items
    type: table
    fields: [users.city, users.city,
      users.city, users.city,
      users.city, users.city]
    pivots: [users.city, users.city]
    filters:
      users.city: "-CANCELLED,-REFUNDED,-RETURNED,-NULL"
      users.city: "-NULL,-CANCELLED, -RETURNED"
      users.city: 'Yes'
      order_items.id: ''
      users.city: ''
    sorts: [users.city desc, users.city,
      sort]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: total_queue_per_column, label: Total Queue
          per Column, expression: 'if(${colabo_public_oms_item_status_activity_history.progress}
          = "In Queue",${colabo_public_code_eight_purchase_order_item.total_units},null)',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: measure, _type_hint: number}, {table_calculation: sort, label: SORT,
        expression: "if(${colabo_public_oms_item_status_activity_history.status} =\
          \ \"PLACED\" , 1 ,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"SOURCED\" , 2 ,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"ORDERED\", 3,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"DISPATCHED\", 4,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"RECEIVED\", 5,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"INDUCTED\", 6,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"PACKED\", 7,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"QC_SIGNED_OFF\", 8,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"QC_APPROVED\", 8,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"SHIPPED\", 9,\nif(${colabo_public_oms_item_status_activity_history.status}\
          \ = \"DELIVERED\", 10,10)))))))))))", value_format: !!null '', value_format_name: !!null '',
        is_disabled: false, _kind_hint: dimension, _type_hint: number}, {table_calculation: total_in_queue_units,
        label: Total In Queue Units, expression: 'sum(pivot_row(${total_queue_per_column}))',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: total_stalled_units,
        label: Total Stalled Units, expression: "${colabo_public_oms_item_status_activity_history_stalled_units.stalled_units:row_total}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_completed_units, label: Total
          Completed Units, expression: 'sum(pivot_row(${total_completed_per_column}))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_in_queue_time, label: Total
          In Queue Time, expression: 'coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},1),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},2),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},3),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},4),0)

          ', value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: total_completed_time,
        label: Total Completed Time, expression: 'coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},5),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},6),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},7),0)+coalesce(pivot_index(${colabo_public_oms_item_status_activity_history.total_time_difference},8),0)

          ', value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: aging_in_minutes,
        label: Aging (in Minutes), expression: "${total_in_queue_time}/ ${total_in_queue_units}",
        value_format: !!null '', value_format_name: decimal_0, is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: turn_around_time_in_minutes,
        label: Turn Around Time (in Minutes), expression: "${total_completed_time}/${total_completed_units}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_completed_per_column, label: Total
          Completed per Column, expression: 'if(${colabo_public_oms_item_status_activity_history.progress}
          = "Completed",${colabo_public_code_eight_purchase_order_item.total_units},null)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: [colabo_public_oms_item_status_activity_history.total_time_difference,
      total_in_queue_time, total_completed_time, colabo_public_oms_item_status_activity_history_stalled_units.stalled_units,
      sort, total_queue_per_column, total_completed_per_column]
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Filtered to only reflect Jetblack Runner or other local delivery methods
      (e.g., Postmates)
    listen: {}
    row: 15
    col: 0
    width: 23
    height: 8
