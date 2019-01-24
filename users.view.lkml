view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
#     primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: concat(${first_name}, " ", ${last_name}) ;;
  }

  filter: user {
    type: string
  }

#   filter: employee_and_customer_location {
#     sql:
#       {% condition user %} ${users.id} {% endcondition %}
#           AND
#       {% condition user %} ${users.name} {% endcondition %}
#   ;;
#   }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    html: <b><center>{{value}}</center></b> ;;
  }

  dimension: gender {
    type: string
    sql:${TABLE}.gender ;;
  }

  dimension: is_female {
    type: yesno
    sql: ${gender} = "f";;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      order_items.returned,
      order_items.sale_price,
      order_items.count,
      id,
      first_name,
      last_name,
      orders.count,
    ]
  }
}
