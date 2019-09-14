- dashboard: testing_dashboard
  title: Testing Dashboard
  layout: newspaper
  description: description of a dashboard
  # query_timezone: query_saved
  elements:
  - title: Column
    name: Column
    model: the_look
    explore: orders
    type: looker_column
    fields: [products.brand, order_items.count, order_items.average_sale_price]
    filters:
      users.id: '8864,8863,8860,8857,8852,8831,8826,8786,8783,8776,8770,8765,8736,8735,8734,8733,8722,8716,8707,8701,8699,8696,8680,8671,8668,8662,8659,8655,8651,8650,8648,8646,8643,8640,8639,8638,8637,8632,8631,8625,8622,8619,8616,8613,8612,8611,8609,8601,8598,8589'
    sorts: [order_items.average_sale_price desc]
    limit: 10
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types:
      products.average_retail_price: line
      order_items.count: line
    limit_displayed_rows: false
    y_axes: [{label: !!null '', orientation: left, series: [{id: order_items.average_sale_price,
            name: Order Items Average Sale Price, axisId: order_items.average_sale_price}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{id: order_items.count, name: Order Items Count, axisId: order_items.count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 0
    width: 12
    height: 8
  - name: Testing Dashboard
    type: text
    title_text: Testing Dashboard
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Orders
    name: Orders
    model: the_look
    explore: orders
    type: single_value
    fields: [products.count]
    limit: 500
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Orders
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Gender: users.gender
      id: order_items.item_id
    row: 2
    col: 12
    width: 12
    height: 2
  - title: User Name
    name: User Name
    model: the_look
    explore: orders
    type: single_value
    fields: [users.name]
    limit: 500
    custom_color: ''
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Gender: users.name
      id: orders.id
    row: 2
    col: 0
    width: 12
    height: 2
  - title: Column (copy)
    name: Column (copy)
    model: the_look
    explore: orders
    type: looker_column
    fields: [products.brand, order_items.count, order_items.average_sale_price]
    filters:
      users.id: '8864,8863,8860,8857,8852,8831,8826,8786,8783,8776,8770,8765,8736,8735,8734,8733,8722,8716,8707,8701,8699,8696,8680,8671,8668,8662,8659,8655,8651,8650,8648,8646,8643,8640,8639,8638,8637,8632,8631,8625,8622,8619,8616,8613,8612,8611,8609,8601,8598,8589'
    sorts: [order_items.average_sale_price desc]
    limit: 10
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types:
      products.average_retail_price: line
      order_items.count: line
    limit_displayed_rows: false
    y_axes: [{label: !!null '', orientation: left, series: [{id: order_items.average_sale_price,
            name: Order Items Average Sale Price, axisId: order_items.average_sale_price}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{id: order_items.count, name: Order Items Count, axisId: order_items.count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 14
    col: 6
    width: 18
    height: 4
  - title: City
    name: City
    model: the_look
    explore: orders
    type: single_value
    fields: [users.city]
    sorts: [users.city]
    limit: 500
    show_view_names: 'true'
    series_types: {}
    listen: {}
    row: 12
    col: 0
    width: 6
    height: 11
  - title: User Name (copy)
    name: User Name (copy)
    model: the_look
    explore: orders
    type: single_value
    fields: [users.first_name]
    limit: 500
    custom_color: ''
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen: {}
    row: 12
    col: 6
    width: 18
    height: 2
  - name: Pie
    title: Pie
    model: the_look
    explore: orders
    type: looker_pie
    fields: [products.department, products.count]
    sorts: [products.count desc]
    limit: 500
    # query_timezone: America/Los_Angeles
    series_types: {}
    note_state: expanded
    note_display: below
    note_text: this is a carefully crafted description
    listen: {}
    row: 4
    col: 12
    width: 12
    height: 8
  - title: Table
    name: Table
    model: the_look
    explore: orders
    type: table
    fields: [inventory_items.id, inventory_items.created_date, inventory_items.cost]
    filters:
      inventory_items.created_date: after 2019/05/01
    sorts: [calculation_1 asc]
    limit: 25
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${inventory_items.id}\
          \ * 1.0", value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    # query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: [inventory_items.cost], color_application: {collection_id: legacy,
          palette_id: legacy_sequential3, options: {steps: 5, stepped: false, mirror: true}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 18
    col: 6
    width: 18
    height: 13
  filters:
  - name: Gender
    title: Gender
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: the_look
    explore: orders
    listens_to_filters: []
    field: users.gender
  - name: User
    title: User
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: the_look
    explore: orders
    listens_to_filters: []
    field: users.name
  - name: Date
    title: Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
  - name: id
    title: id
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: the_look
    explore: orders
    listens_to_filters: []
    field: orders.id
