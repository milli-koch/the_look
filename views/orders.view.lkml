view: orders {
  sql_table_name: demo_db.orders ;;
#   sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: -- my name is {{ _user_attributes['name'] }}
      ${TABLE}.id ;;
  }

  dimension: if {
    sql: {% if id == 1 %}
    ${id}
    {% endif %};;
  }

  # parameter: cohort_stage {
  #   label: "Cohort Stage"
  #   type: string
  #   suggest_dimension: orders.stage
  #   default_value: "{{ _localization['My Key'] }}"
  # }

  # dimension: stage {
  #   label: "Stage"
  #   sql:  '{{ _localization['My Key'] }}'  ;;
  # }

  # dimension: if_in_query {
  #   type: string
  #   sql: {% if products._in_query %}
  #   true
  #   {% else %}
  #   ${users.id}
  #   {% endif %}
  #   ;;
  # }



  dimension: end_date {
    sql: {% date_end created_date %} ;;
  }

  dimension: test_link {
    sql: '1' ;;
    link: {
      label: "test google with line break"
      url:
      "https://google{% comment %}
      {% endcomment %}.{% comment %}
      {% endcomment %}com"
    }
  }

  parameter: day_ago {
    type: number
  }

  dimension: user_order_sequence_number {
    type: number
    sql:
    (
      SELECT COUNT(*)
      FROM orders AS o
      WHERE o.id <= ${TABLE}.id
        AND o.user_id = ${TABLE}.user_id
    ) ;;
  }

  dimension: id_filter {
    type: string
    sql: ${id};;
    html:
      {% if order_items.sale_price._value < 0 %}
      1
      {% endif %}
      {{ order_items.sale_price._value }}
      {{ products.retail_price._value }};;
}

  parameter: bool_filter {
    type: yesno
  }

  parameter: filter_logic {
    type: unquoted
    allowed_value: {
      label: "OR"
      value: "OR"
    }
    allowed_value: {
      label: "AND"
      value: "AND"
    }
  }

  dimension: bool {
    sql: {% parameter bool_filter %} ;;
  }

  dimension: model_name {
    sql: 1 ;;
    html: {% if _model._name  == 'the_look' %}
    "yes"
    {% else %}
    "no"
    {% endif %};;
  }

  parameter: time_period {
    type: unquoted
    allowed_value: {
      value: "WTD"
    }
    allowed_value: {
      value: "MTD"
    }
    allowed_value: {
      value: "QTD"
    }
    allowed_value: {
      value: "YTD"
    }
  }

  dimension: is_wtd {
    type: yesno
    hidden: yes
    sql: ${created_raw} > TO_DATE(DATE_TRUNC('week', CURRENT_DATE())) AND ${created_raw} < TO_DATE(DATEADD('day', 7, DATE_TRUNC('week', CURRENT_DATE()))) ;;
  }

  dimension: is_mtd {
    type: yesno
    hidden: yes
    sql: ${created_raw} > TO_DATE(DATE_TRUNC('month', CURRENT_DATE())) AND ${created_raw} < TO_DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE()))) ;;
  }

  dimension: is_qtd {
    type: yesno
    hidden: yes
    sql: ${created_raw} > TO_DATE(DATE_TRUNC('quarter', CURRENT_DATE())) AND ${created_raw} < (TO_DATE(DATEADD('month', 3, CAST(DATE_TRUNC('quarter', CAST(DATE_TRUNC('quarter', CURRENT_DATE()) AS DATE)) AS DATE)))) ;;
  }

  dimension: is_ytd {
    type: yesno
    hidden: yes
    sql: ${created_raw} > TO_DATE(DATE_TRUNC('year', CURRENT_DATE())) AND ${created_raw} < TO_DATE(DATEADD('year', 1, DATE_TRUNC('year', CURRENT_DATE()))) ;;
  }

  parameter: filter_or_no {
    type: yesno
  }

  dimension: filter_value {
    type: yesno
    sql: {% parameter filter_or_no %} ;;
  }

  dimension: to_test_that_parameter{
    sql: 1 ;;
    html: {{ orders.filter_or_no._parameter_value }} ;;
  }

  measure: list {
    type: list
    list_field: id
    html: <span style="white-space: pre;"> {{ value }} </span> ;;
  }

#   measure: list_2 {
#     type: string
#     sql: list(${id}) ;;
#   }

#   measure: math {
#     type: number
#     sql: ${users.id} * ${count};;
#     html: <span style="white-space: pre;"> value </span> ;;
#
#   }

  dimension: timezone {
    label: "What Time Is It Right Now"
    sql: current_timestamp;;
    html: {{value}} {{ _query._query_timezone }} ;;
  }

  dimension: days_ago {
    type: duration_day
    sql_start: ${created_date} ;;
    sql_end: current_timestamp ;;
    html: {{ value }} days ago ;;
  }

  parameter: mtd {
    type: string
    suggest_dimension: id
  }

  dimension: Drill_to_State{
    label: "Drill to State"
    sql: 'Drill to State' ;;
#       link: {
#       link: {
#         label: "Drill to State"
##     url: "https://sandbox-lookerbi.corelogic.net/dashboards/306?Customer_ID={{ _filters['lu_cust_vk.CustomerID'] | url_encode }}"
##      icon_url: "https://looker.com/favicon.ico"
##        url:"https://sandbox-lookerbi.corelogic.net/dashboards/306?Customer_ID={{ _filters['Customer.Customer_id_filter'] | url_encode }}"
#         url:"./306?Customer_ID={{ _filters['Customer.Customer_id_filter'] | url_encode }}"
#         }
##        url:"/dashboards/306?Customer_ID={{ _filters['Customer.Customer_id_filter'] | url_encode }}"  }
##    html: <font size="10" color="#000000">{{rendered_value}} ;;
    html:
      {% if _user_attributes['sw_embed_domain'] | size > 0 %}
        <a href="/embed/dashboards/306?Customer={{ _filters['Customer.Customer_id_filter'] | url_encode }}
        {% if _user_attributes['sw_embed_domain'] | size > 0 %}&embed_domain={{ _user_attributes['sw_embed_domain'] }}
        {% endif %}" target="_blank">Drill to State</a>
      {% else%}
        <a href="/dashboards/306?Customer={{ _filters['Customer.Customer_id_filter'] | url_encode }}
        {% if _user_attributes['sw_embed_domain'] | size > 0 %}&embed_domain={{ _user_attributes['sw_embed_domain'] }}
        {% endif %}" target="_blank">Drill to State</a>
      {% endif %}
      ;;
  }

  dimension: created_year_test {
    type: date_year
    suggestions: ["2019","2018","2017"]
  }

  dimension: date_is_mtd {
    type: yesno
    sql:
    date_part('MONTH', ${created_raw}) = date_part('MONTH', {% parameter mtd %}) and
    date_part('DAY', ${created_raw}) <= date_part('DAY', {% parameter mtd %});;
  }

  dimension: date {
    type: date
    sql: dateadd(day, -1, {% parameter mtd %}) ;;
    required_access_grants: [user_fields]
  }

  parameter: date_value {
    type: date
  }

  dimension: date_filter_value {
#     sql: 1 ;;
  sql: concat(date_format({% date_start created_date %}, '%b %e %Y'), " to ", date_format({% date_end created_date %}, '%b %e %Y')) ;;
}

dimension: date_expression {
  sql: 1;;
  html: Date is {{ _filters['orders.created_date'] }} ;;
}

parameter: timeframe_select {
  type: string
  allowed_value: { value: "Week" }
  allowed_value: { value: "Month" }
  allowed_value: { value: "Quarter" }
  }

  dimension: parameter_value {
    sql: {{ timeframe_select._parameter_value }} ;;
  }

dimension: selected_timeframe  {
   # sql: {% if timeframe_select._parameter_value == 'Week' %}
  # ${created_week_of_year}
  # {% elsif timeframe_select._parameter_value == 'Month' %}
  # ${created_month_num}
  # {% elsif timeframe_select._parameter_value == 'Quarter' %}
  # ${created_quarter_of_year}
  # {% else %}
  # null
  # {% endif %};;
sql: CASE
    WHEN {% parameter timeframe_select %} = 'Week' THEN cast(${created_week_of_year} as char)
    WHEN {% parameter timeframe_select %} = 'Month' THEN cast(${created_month_num} as char)
    WHEN {% parameter timeframe_select %} = 'Quarter' THEN cast(${created_quarter_of_year} as char)
    ELSE NULL
  END ;;
}

dimension: order_by_field {
  sql: {% if timeframe_select  == 'Week' %}
  "yes"
  {% else %}
  "no"
  {% endif %};;
}

parameter: campus {
  type: string
  default_value: "Any"
  suggest_dimension: products.brand
}

dimension: campus_name {
  html: {%if value = parameter campus %}

    ;;
}

parameter: country_input {
  type: unquoted
  default_value: "Any"
  suggest_dimension: users.country
}
#


filter: date_input {
    type: date
  }

dimension: date_start_input {
#     hidden: yes
sql: {% date_start date_input %} ;;
type: date
}

dimension: date_end_input {
#     hidden: yes
sql: {% date_end date_input %} ;;
type: date
}

dimension: display_text {
  html: Date: {% if _filters['orders.created_date'] == "" %}
          Any Value
          {% else %}
          {{ _filters['orders.created_date'] }}
          {% endif %}
          <br>
          Brand: {% if _filters['products.brand'] == "" %}
          Any Value
          {% else %}
          {{ _filters['products.brand'] }}
          {% endif %}
          <br>
          Country: {% if _filters['users.country'] == "" %}
          Any Value
          {% else %}
          {{ _filters['users.country'] }}
          {% endif %}
          ;;
  sql: 1 ;;
}

dimension_group: created {
  type: time
  timeframes: [
    raw,
    millisecond500,
    second,
    hour,
    time,
    date,
    time_of_day,
    week,
    month,
    month_name,
    day_of_year,
    day_of_month,
    quarter,
    quarter_of_year,
    year,
    day_of_week,
    week_of_year,
    month_num
  ]
#     sql: CONVERT_TZ ('UTC', 'America/Los_Angeles', ${TABLE}.created_at) ;;
  sql: ${TABLE}.created_at ;;
#     datatype: date
  convert_tz: no
}

dimension: fiscalyearmonth {
  type: string
  sql: cast(${created_month} as string) ;;
}

dimension: created_date_of_year {
  type: date
  sql: date_format(${created_date}, "%c %d") ;;
}

dimension: month {
  type: date_month_num
  html: <p style="font-size:30px"> {{value}} </p> ;;
#     html: <p style="font-size:30px"> {{variant_list}} </p>;;

  sql: ${created_week_of_year} ;;
}

filter: MTD_filter {
  type: date
}

dimension: is_before_mtd {
  type: yesno
  sql:date_trunc('MONTH' from {% condition MTD_filter %} ${created_date} {% endcondition %}) < {% condition MTD_filter %} ${created_date} {% endcondition %}
    );;
}

dimension_group: created_same {
  type: time
  timeframes: [
    raw,
    millisecond500,
    second,
    hour,
    time,
    date,
    time_of_day,
    week,
    month,
    month_name,
    day_of_month,
    quarter,
    year,
    day_of_week
  ]
  sql: ${created_raw} ;;
  convert_tz: no
}

dimension: tz_date {
  type: date
  sql: ${created_date} ;;
#     convert_tz: no
}

dimension: date_formatted {
  type: date_time
  sql: datediff(${created_other_time}, ${created_time}) ;;
  # value_format: "[hh]:mm:dd"
}

#   filter: date_filter {
#     type: date
#   }

parameter: selected_city {
  type: string
  allowed_value: {
    label: "New York"
    value: "New York"
  }
  allowed_value: {
    label: "Farmingdale"
    value: "Farmingdale"
  }
  allowed_value: {
    label: "Rochester"
    value: "Rochester"
  }
  allowed_value: {
    label: "Chaska"
    value: "Chaska"
  }
}

dimension: distance_city_lat {
# hidden: yes
type: number
sql: CASE WHEN {% parameter selected_city %} = 'New York' THEN 40.758124
    WHEN {% parameter selected_city %} = 'Farmingdale' THEN 40.739527
    WHEN {% parameter selected_city %} = 'Rochester' THEN 43.1130973
    WHEN {% parameter selected_city %} = 'Chaska' THEN 44.834909
    ELSE 40.758124 END ;;
}

filter: first_period_filter {
  group_label: "Arbitrary Period Comparisons"
  type: date
}

dimension: days_from_start_first {
  hidden: yes
  type: number
  sql: DATEDIFF({% date_start first_period_filter %}, ${created_date}) ;;
}

dimension: days_from_first_period {
  group_label: "Arbitrary Period Comparisons"
  type: number
  sql:
      CASE
       WHEN ${days_from_start_first} >= 0
       THEN ${days_from_start_first}
      END;;
}

# dimension: user_name {
#   sql: ${user.name} ;;
# }

parameter: latitude_selector {
  type: number
}

parameter: longitude_selector {
  type: number
}

dimension: new_york_city {
  type: location
  sql_latitude: 40.7128  ;;
  sql_longitude: 74.0060 ;;
}

# dimension: location {
#   type: location
#   sql_latitude: {% parameter latitude_selector %} ;;
#   sql_longitude: {% parameter longitude_selector %} ;;
# }

# measure: min_date {
#   type: date
#   sql: min(${TABLE}.created_at) ;;
#   convert_tz: no
# }

measure: max_date {
  type: date
  sql: max(${TABLE}.created_at) ;;
  drill_fields: [tiimeframes*]
}

set: tiimeframes {
  fields: [created_week, created_date, created_hour]
}

dimension_group: created_other {
  type: time
  timeframes: [
    raw,
    millisecond500,
    time,
    date,
    day_of_week,
    day_of_week_index,
    week,
    month,
    quarter,
    year,
    day_of_month,
    month_name,
    day_of_year
  ]
  sql: DATE_ADD(DATE_ADD(DATE_ADD(DATE_ADD(DATE_ADD(${created_raw}, INTERVAL 3 DAY), INTERVAL 9 HOUR), INTERVAL 35 MINUTE), INTERVAL 46 SECOND), INTERVAL 60 MICROSECOND) ;;
  html:
  {% if value != "now" | date: "%Y-%m-%d" %}
  <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
  {% else %}
  <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
  {% endif %}
  ;;


}

filter: previous_period_filter {
  type: date
  description: "Use this filter for period analysis"
}

dimension: previous_period {
  type: string
  description: "The reporting period as selected by the Previous Period Filter"
  sql:
      CASE
        WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${created_raw} >=  {% date_start previous_period_filter %}
                AND ${created_raw} <= {% date_end previous_period_filter %}
                THEN {% date_start previous_period_filter %}
              WHEN ${created_raw} >= DATE_ADD({% date_start previous_period_filter %}, INTERVAL -365 day)
                AND ${created_raw} <= DATE_ADD({% date_end previous_period_filter %}, INTERVAL -365 day)
                THEN {% date_end previous_period_filter %}
            END
          END ;;
  html: {{rendered_value | date : "%F" }} ;;
}

measure: hours_formatted {
  type: date
  sql: max(${created_raw}) ;;
}

dimension_group: date_diff {
  type: duration
  intervals: [second, minute, hour, day]
  sql_start: ${created_raw} ;;
  sql_end:${created_other_raw} ;;
  html: <div style="background-color: rgba(200,35,25,{{value}}); font-size:150%; text-align:center">{{ value }}</div> ;;
}


dimension: dur_hours {
  type: duration_hour
  sql_start: ${created_other_raw} ;;
  sql_end:${created_raw} ;;
  # value_format: "[hh]:mm:dd"
}

measure: avg_duration {
  type: time
  sql: case when ${dur_hours} = 0 then null else ${dur_hours} end ;;
}

measure: max_po_date {
  label: "Max Purchase Order Date"
  description: "Maximum Purchase Order Date over dimensions selected"
  type: time
  timeframes: [
    raw,
    date,
    week,
    month,
    quarter,
    year,
    day_of_week,
    day_of_month,
    day_of_year,
    week_of_year,
    quarter_of_year,
    time_of_day,
    hour_of_day,
    month_num,
    month_name
  ]
  convert_tz: no
  sql: MAX(${created_date}) ;;
}


measure: count {
  type: count
#     value_format: "[>=1000000000]0,,,\” B\“; [>=1000000]0,,\” M\“; [>=1000]0,\” K\“; #"
#     required_fields: [created_date]
#     drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count, date_diff_second]
#     drill_fields: [seconds_date_diff]
#   filters: {
#     field: created_date
#     value: "7 days"
#   }
}

measure: running_total {
  type: running_total
  sql: ${count};;
  }

#   dimension: seconds {
#     group_label: "Duration"
#     type: number
#     sql: ${date_diff};;
#   value_format: "[h]:mm:ss"
#     html: {{ rendered_value | date: "%X" }} ;;
#     }
#
#   dimension:  date_diff {
#     type: number
#     sql: TIMESTAMPDIFF(SECOND,${created_raw},${created_other_date_raw})/86400.0;;
#     value_format: "[h]:mm:ss"
#   }
#
#   dimension: minutes {
#     group_label: "Duration"
#     type: number
#     sql: ${seconds}/60 ;;
#     html: {{ rendered_value | date: "%M" }} ;;
#     }
#
#   dimension: hours {
#     group_label: "Duration"
#     type: number
#     sql: ${seconds}/3600 ;;
#     html: {{ rendered_value | date: "%X" }} ;;
#     }

  measure: outside_working_hours {
    type: count_distinct
    filters: {
      field: created_time_of_day
      value: "00:00"
    }
    sql: ${id} ;;
  }

  measure: refunded_order_count {
    label: "Refunded Order Count"
    description: "Each order that had a refund issued (eg multiple partial refunds only count as 1 total, and multiple line items only count as 1 total)"
    type: count_distinct
    filters: {
      field: is_cancelled
      value: "yes"
    }
    sql: ${id} ;;
  }

  filter: is_cancelled {
    type: yesno
    sql: ${status} = "cancelled" ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${status} = "cancelled" ;;
  }



#   dimension: cancelled_boolean {
#     type: number
#     sql: ${is_cancelled::number} ;;
#   }
#
  measure: sum_cancelled {
    type: sum
    sql: ${is_cancelled::boolean} ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    html: {% if value == 'complete' %}
          <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ value }}</p>
          {% elsif value == 'pending' %}
          <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ value }}</p>
          {% else %}
          <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ value }}</p>
          {% endif %}
          ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: rank {
    type: number
    sql:RANK() OVER(PARTITION BY ${user_id} ORDER BY orders.count DESC) ;;
  }

  dimension: dividing {
    type: number
    sql: 1/2 ;;
    value_format_name: percent_2
  }

  measure: total_dividing {
    type: sum
    sql: ${dividing} ;;
    value_format_name: percent_2
    filters: {
      field: created_date
      value: "last month"
    }
  }

  measure: user_id_list {
    type: list
    list_field: user_id
  }

  measure: count_mtd {
    type: count
    drill_fields: [id, created_day_of_week, created_date]
    filters: {
      field: mtd
      value: "yes"
    }
  }

  measure: count_this_week{
    type: count
    drill_fields: [id, created_day_of_week, created_date]
    filters: {
      field: created_date
      value: "this week,last week"
    }
  }


}

# explore: cranberry_sauce {}
