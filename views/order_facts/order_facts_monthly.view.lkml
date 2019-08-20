view: order_facts_monthly {
  derived_table: {
    sql: select extract(month from created_at) as time
    from demo_db.orders
    group by 1;;
    datagroup_trigger: the_look_default_datagroup
    indexes: ["time"]
  }
}
