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
    convert_tz: no
  }

  measure: outside_working_hours {
    type: count_distinct
    filters: {
      field: created_time_of_day
      value: "00:00"
    }
    sql: ${id} ;;
  }

  dimension: status {
    hidden: yes
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

  measure: user_id_list {
    type: list
    list_field: user_id
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
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
