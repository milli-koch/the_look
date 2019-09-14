- dashboard: sys_activity_performance_dashboard_udd
  title: sys_activity_performance_dashboard_UDD
  layout: newspaper
  refresh: 1 hour
  query_timezone: query_saved
  elements:
  - name: 'tile1'
    type: text
    body_text: <font size="6" color="navy">Queries<br>Per<br>Source</font>
    row: 0
    col: 0
    width: 3
    height: 6
  - name: 'tile2'
    type: text
    body_text: <font size="6" color="navy">Queries<br>Per<br>Users</font>
    row: 6
    col: 0
    width: 3
    height: 6
  - name: 'tile3'
    type: text
    body_text: <font size="5" color="navy">Dashboard<br>Refresh<br>and<br>Downloads</font>
    row: 12
    col: 0
    width: 3
    height: 6
  - name: 'tile4'
    type: text
    body_text: <font size="6" color="navy">PDT<br>Details</font>
    row: 18
    col: 0
    width: 3
    height: 5
  - title: query per source -daily last 7days
    name: query per source -daily last 7days
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.most_recent_run_at_day_of_week, history.source]
    pivots: [history.source]
    filters:
      history.most_recent_run_at_date: 7 days
    sorts: [history.query_run_count desc 0, history.source]
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 36}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml, __LINE_NUM: 31,
        color_application: {collection_id: legacy, custom: {id: 95f8f710-092a-a7e2-9207-021d209d7377,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true, stepped: false}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 3
    width: 10
    height: 6
  - title: query per source -hourly today
    name: query per source -hourly today
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.source, history.most_recent_run_at_hour_of_day]
    pivots: [history.source]
    filters:
      history.most_recent_run_at_date: 1 days
    sorts: [history.source 0, history.most_recent_run_at_hour_of_day]
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 83}, bold: false, italic: false, strikethrough: false, fields: [
          history.query_run_count], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
        __LINE_NUM: 78, color_application: {collection_id: legacy, custom: {id: c16370a1-e351-1bcd-4737-b0cac7a0ecc7,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 13
    width: 10
    height: 6
  - title: query per user -daily last 7days
    name: query per user -daily last 7days
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.most_recent_run_at_day_of_week, user.name]
    pivots: [user.name]
    fill_fields: [history.most_recent_run_at_day_of_week]
    filters:
      history.most_recent_run_at_date: 7 days
    sorts: [history.query_run_count desc 0, user.name]
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 133}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml, __LINE_NUM: 128,
        color_application: {collection_id: legacy, custom: {id: 85ebde76-7c6b-6970-071e-79fda2ac49b3,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 6
    col: 3
    width: 10
    height: 6
  - title: query per user -hourly today
    name: query per user -hourly today
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, user.name, history.most_recent_run_at_hour_of_day]
    pivots: [user.name]
    filters:
      history.most_recent_run_at_date: 1 days
    sorts: [user.name 0, history.most_recent_run_at_hour_of_day]
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 180}, bold: false, italic: false, strikethrough: false, fields: [
          history.query_run_count], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
        __LINE_NUM: 175, color_application: {collection_id: legacy, custom: {id: f0a8933b-1dbc-d775-b39b-7cbd3a8b3929,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 6
    col: 13
    width: 10
    height: 6
  - title: dashboard with refresh interval
    name: dashboard with refresh interval
    model: system__activity
    explore: history
    type: table
    fields: [dashboard.title, history.real_dash_id, dashboard.refresh_interval]
    filters:
      dashboard.refresh_interval: "-NULL"
    sorts: [calculation_2 desc]
    limit: 50
    dynamic_fields: [{table_calculation: order_sort_1, label: order sort 1, expression: "substring(${dashboard.refresh_interval},\n\
          \  0,\n  position(${dashboard.refresh_interval}, \" \"))", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string},
      {table_calculation: calculation_2, label: Calculation 2, expression: "if(\n\
          \  contains(${dashboard.refresh_interval}, \"seconds\"),\n  1,\n  if(contains(${dashboard.refresh_interval},\
          \ \"seconds\"),\n  2,\n  3\n  )\n)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}]
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 225}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml, __LINE_NUM: 220}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [order_sort_1, calculation_2]
    row: 12
    col: 3
    width: 10
    height: 6
  - title: Long Building PDTs
    name: Long Building PDTs
    model: system__activity
    explore: history
    type: table
    fields: [history.message, history.created_time, history.runtime, history.total_runtime]
    filters:
      history.created_date: 24 hours
      history.message: Building derived table%
      history.source: Other
      user.is_looker: 'No'
    sorts: [history.created_time]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 18
    col: 3
    width: 10
    height: 5
  - title: Failed PDT Builds
    name: Failed PDT Builds
    model: system__activity
    explore: history
    type: table
    fields: [history.message, history.query_run_count]
    filters:
      history.created_date: 24 hours
      history.source: Other
      user.is_looker: 'No'
    sorts: [history.message]
    limit: 500
    filter_expression: "contains(${history.message}, \"derived_table\")\nAND \ncontains(${history.message},\
      \ \"failed\")"
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_types: {}
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
    row: 18
    col: 13
    width: 10
    height: 5
  - title: Content Usage Evolution (30days)
    name: Content Usage Evolution (30days)
    model: system__activity
    explore: content_usage
    type: looker_line
    fields: [content_usage.api_total, content_usage.content_count, content_usage.embed_total,
      content_usage.schedule_total, content_usage.other_total, content_usage.last_accessed_date]
    fill_fields: [content_usage.last_accessed_date]
    filters:
      content_usage.last_accessed_date: 30 days
    sorts: [content_usage.last_accessed_date desc]
    limit: 500
    column_limit: 50
    trellis: ''
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: content_usage.api_total,
            name: Content Usage API Total, axisId: content_usage.api_total}, {id: content_usage.content_count,
            name: Content Usage Content Count, axisId: content_usage.content_count},
          {id: content_usage.embed_total, name: Content Usage Embed Total, axisId: content_usage.embed_total},
          {id: content_usage.schedule_total, name: Content Usage Schedule Total, axisId: content_usage.schedule_total},
          {id: content_usage.other_total, name: Content Usage View Total, axisId: content_usage.other_total}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: log}]
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
    show_null_points: false
    interpolation: linear
    listen: {}
    row: 23
    col: 3
    width: 10
    height: 6
  - name: 'tile5'
    type: text
    body_text: <font size="6" color="navy">Content<br>Usage</font>
    row: 23
    col: 0
    width: 3
    height: 7
  - title: Create Event Summary (30days)
    name: Create Event Summary (30days)
    model: system__activity
    explore: event
    type: table
    fields: [event.name, event.count]
    filters:
      event.name: "%create%"
      event.created_date: 30 days
    sorts: [event.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    row: 23
    col: 13
    width: 10
    height: 7
  - title: New Tile
    name: New Tile
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.source, history.created_day_of_week]
    pivots: [history.source]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.query_run_count desc 0, history.source]
    limit: 500
    query_timezone: user_timezone
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 67}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml, __LINE_NUM: 62,
        color_application: {collection_id: legacy, custom: {id: 95f8f710-092a-a7e2-9207-021d209d7377,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0,
                __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml, __LINE_NUM: 87},
              {color: "#FCF758", offset: 50, __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
                __LINE_NUM: 89}, {color: "#4FBC89", offset: 100, __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
                __LINE_NUM: 91}], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
            __LINE_NUM: 83}, options: {steps: 5, reverse: true, stepped: false, __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
            __LINE_NUM: 94}, __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 81}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 29
    col: 3
    width: 8
    height: 6
  - title: Unlimited Downloads
    name: Unlimited Downloads
    model: system__activity
    explore: history
    type: table
    fields: [history.created_time, query.link, user.id, user.name, query.limit]
    filters:
      query.limit: "%-1%"
    sorts: [history.created_time desc]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen: {}
    row: 12
    col: 13
    width: 10
    height: 6
