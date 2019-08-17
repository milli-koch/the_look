- dashboard: '240630'
  title: '240630'
  layout: newspaper
  refresh: 15 minutes
  elements:
  - title: New Tile
    name: New Tile
    model: '232393'
    explore: order_items
    type: table
    fields: [order_items.order_id, order_items.sale_price]
    sorts: [order_items.order_id]
    limit: 500
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#5cc2f5",
        font_color: !!null '', color_application: {collection_id: b40c75b1-e794-482f-8fb6-9373a0052342,
          palette_id: fd886420-6da6-4a87-b6c7-1550f762e4cb, options: {steps: 5, constraints: {
              min: {type: number, value: 15}, mid: {type: number, value: 15}, max: {
                type: number, value: 15}}}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 7
  - title: New Tile
    name: wowfun
    model: '232393'
    explore: order_items
    type: table
    fields: [order_items.order_id, order_items.sale_price]
    sorts: [order_items.order_id]
    limit: 500
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#5cc2f5",
        font_color: !!null '', color_application: {collection_id: b40c75b1-e794-482f-8fb6-9373a0052342,
          palette_id: fd886420-6da6-4a87-b6c7-1550f762e4cb, options: {steps: 5, constraints: {
              min: {type: number, value: 15}, mid: {type: number, value: 15}, max: {
                type: number, value: 15}}}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 0
    col: 7
    width: 2147483647000
    height: 7
  filters:
  - name: Untitled Filter
    title: Untitled Filter
    type: field_filter
    default_value: 3 months
    allow_multiple_values: true
    required: false
    model: '232393'
    explore: order_items
    listens_to_filters: []
    field: inventory_items.created_month
