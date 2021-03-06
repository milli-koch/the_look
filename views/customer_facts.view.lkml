view: customer_facts {
  derived_table: {
    sql:
      SELECT
        id as customer_id,
        SUM(retail_price) AS lifetime_spend
      FROM
        products
    ;;
    indexes: ["customer_id"]
    datagroup_trigger: the_look_default_datagroup
    publish_as_db_view: yes
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
