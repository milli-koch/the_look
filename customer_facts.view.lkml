view: customer_facts {
  derived_table: {
    sql:
      SELECT
        customer_id,
        SUM(sale_price) AS lifetime_spend
      FROM
        order
      WHERE
        {% condition order_region %} order.region {% endcondition %}
    ;;
    indexes: ["customer_id"]
    datagroup_trigger: the_look_default_datagroup
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: total_lifetime_spend {
    type: number
    sql: ${TABLE}.lifetime_spend ;;
  }

  filter: order_region {
    type: string
  }
}
