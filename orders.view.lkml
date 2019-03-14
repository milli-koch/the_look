view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
      day_of_month,
      quarter,
      year,
      day_of_week
    ]
    sql: ${TABLE}.created_at ;;
#     datatype: date
    convert_tz: no
  }

  dimension: tz_date {
    type: date
    sql: ${created_date} ;;
#     convert_tz: no
  }

  filter: date_filter {
    type: date
  }




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

dimension: location {
  type: location
  sql_latitude: {% parameter latitude_selector %} ;;
  sql_longitude: {% parameter longitude_selector %} ;;
}

  # measure: min_date {
  #   type: date
  #   sql: min(${TABLE}.created_at) ;;
  #   convert_tz: no
  # }

  measure: date_field {
    type: date
    sql: max(${TABLE}.created_at) ;;
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
                THEN 'This Period'
              WHEN ${created_raw} >= DATE_ADD({% date_start previous_period_filter %}, INTERVAL -365 day)
                AND ${created_raw} <= DATE_ADD({% date_end previous_period_filter %}, INTERVAL -365 day)
                THEN 'Previous Period'
            END
          END ;;
  }

  measure: hours_formatted {
    type: date
    sql: max(${created_raw}) ;;
  }

  dimension_group: date_diff {
    type: duration
    intervals: [second, minute, hour, day]
    sql_start: ${created_other_raw} ;;
    sql_end:${created_raw} ;;
    html: {{ rendered_value | date: "%X" }} ;;

  }


  dimension: dur_hours {
    type: duration_hour
    sql_start: ${created_other_raw} ;;
    sql_end:${created_raw} ;;
  }

  measure: avg_duration {
    type: average
    sql: case when ${dur_hours} = 0 then null else ${dur_hours} end ;;
  }

  measure: count {
    type: count
#     drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count, date_diff_second]
#     drill_fields: [seconds_date_diff]
  }

#   dimension: created_1hour {
#     typ
#   }


#   dimension: seconds {
#     group_label: "Duration"
#     type: number
#     sql: ${date_diff_2};;
#   value_format: "[h]:mm:ss"
# #     html: {{ rendered_value | date: "%X" }} ;;
#     }

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

  dimension: is_cancelled {
    type: yesno
    sql: ${statuz} = "cancelled" ;;
  }

  dimension: statuz {
    type: string
    sql: ${TABLE}.status ;;
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
  }

  measure: user_id_list {
    type: list
    list_field: user_id
  }

  measure: count_filtered {
    type: count
    drill_fields: [id, created_day_of_week, created_date]
    filters: {
      field: created_date
      value: "before tomorrow"
    }
  }

  measure: count_this_week{
    type: count
    drill_fields: [id, created_day_of_week, created_date]
    filters: {
      field: created_date
      value: "this week"
    }
  }
}
