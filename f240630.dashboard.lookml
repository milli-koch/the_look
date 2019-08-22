- dashboard: f240630
  title: f240630
  layout: newspaper
  refresh: 900000000 hours
  elements:
  - title: Stalled Units and Logistics Performance - Overall
    name: Stalled Units and Logistics Performance - Overall
    model: f232393
    explore: order_items
    type: table
    fields: [users.city, users.count,
      users.created_date, products.count,
      users.first_name, inventory_items.created_date]
    sorts: [users.first_name desc, inventory_items.created_date,
      users.count desc]
    limit: 500
    column_limit: 50
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
    fields: [users.city, users.count,
      users.created_date, products.count,
      users.first_name, inventory_items.created_date]
    sorts: [users.first_name desc, inventory_items.created_date,
        users.count desc]
    limit: 500
    column_limit: 50
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
    fields: [users.city, users.count,
      users.created_date, products.count,
      users.first_name, inventory_items.created_date]
    sorts: [users.first_name desc, inventory_items.created_date,
        users.count desc]
    limit: 500
    column_limit: 50
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
    fields: [users.city, users.count,
        users.created_date, products.count,
        users.first_name, inventory_items.created_date]
    sorts: [users.first_name desc, inventory_items.created_date,
        users.count desc]
    limit: 500
    column_limit: 50
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
